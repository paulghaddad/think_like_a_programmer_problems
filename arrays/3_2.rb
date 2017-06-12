class AgentSalesAnalyzer
  attr_reader :num_agents, :sales, :months

  def initialize(sales:)
    @sales = sales
  end

  def highest_monthly_sales_average
    sales.inject(0.0) do |highest_monthly_sales_average, agent_monthly_sales|
      agent_monthly_sales_average = average(agent_monthly_sales)

      if agent_monthly_sales_average > highest_monthly_sales_average
        highest_monthly_sales_average = agent_monthly_sales_average
      else
        highest_monthly_sales_average
      end
    end
  end

  def highest_median_sales
    sales.inject(0.0) do |highest_median_sales, agent_monthly_sales|
      agent_monthly_median_sales = median(agent_monthly_sales)

      if agent_monthly_median_sales > highest_median_sales
        highest_median_sales = agent_monthly_median_sales
      else
        highest_median_sales
      end
    end
  end

  private

  def average(data)
    sum = data.inject(0.0) do |running_sum, data_point|
      running_sum += data_point
    end

    sum / data.size
  end

  def median(data)
    sorted_data = data.sort
    midpoint = data.size / 2

    if data.size.odd?
      sorted_data[midpoint]
    else
      (sorted_data[midpoint] + sorted_data[midpoint - 1]) / 2
    end
  end
end
