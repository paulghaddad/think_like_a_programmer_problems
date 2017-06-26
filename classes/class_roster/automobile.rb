require "date"

class Automobile
  attr_reader :manufacturer, :model, :year

  def initialize(manufacturer:, model:, year:)
    @manufacturer = manufacturer
    @model = model
    @year = DateTime.new(year).year
  end

  def description
    "%s %s %s" % [year, manufacturer, model]
  end

  def age
    DateTime.now.year - year
  end
end
