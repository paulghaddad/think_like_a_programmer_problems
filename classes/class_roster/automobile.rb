class Automobile
  attr_reader :manufacturer, :model, :year

  def initialize(manufacturer:, model:, year:)
    @manufacturer = manufacturer
    @model = model
    @year = year
  end
end
