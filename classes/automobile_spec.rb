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

  describe "description" do
    it "returns a description of the vehicle" do
      new_car = Automobile.new(manufacturer: "Toyota", model: "Camry", year: 2016)

      description = new_car.description

      expect(description).to match("2016 Toyota Camry")
    end
  end

  describe "age" do
    it "returns the age of the vehicle" do
      new_car = Automobile.new(manufacturer: "Toyota", model: "Camry", year: 2016)

      age = new_car.age

      expect(age).to eq 1
    end
  end
end
