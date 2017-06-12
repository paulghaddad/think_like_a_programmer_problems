require "./3_2"

describe "Problem 3-2" do
  describe "#highest_monthly_sales_average" do
    it "calculates the highest 12 month sales average for an agent" do
      analyzer = AgentSalesAnalyzer.new(sales: sales)

      expect(analyzer.highest_monthly_sales_average).to eq(43220.5)
    end
  end

  describe "#highest_median_sales" do
    it "calculates the highest median sales for an agent" do
      analyzer = AgentSalesAnalyzer.new(sales: sales)

      expect(analyzer.highest_median_sales).to eq(4872.0)
    end
  end

  private

  def sales
    [
      [1856, 498, 30924, 87478, 328, 2653, 387, 3754, 387587, 2873, 276, 32],
      [5865, 5456, 3983, 6464, 9957, 4785, 3875, 3838, 4959, 1122, 7766, 2534],
      [23, 55, 67, 99, 265, 376, 232, 223, 4546, 564, 4544, 3434]
    ]
  end
end
