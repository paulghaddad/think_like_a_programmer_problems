require "./automobile"

describe Automobile do
  describe "attributes" do
    it "has a manufacturer, model and year attributes" do
      new_car = Automobile.new(manufacturer: "Toyota", model: "Camry", year: 2016)

      expect(new_car).to have_attributes(manufacturer: "Toyota",
                                        model: "Camry",
                                        year: 2016)
    end
  end
end
