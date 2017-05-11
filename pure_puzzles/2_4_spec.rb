require "./2_4"

describe "Problem 2.4" do
  it "outputs an hourglass" do
    shape = hourglass

    expect(shape).to eq(HOURGLASS)
  end

  private

  HOURGLASS = <<~HOURGLASS
    ########
     ###### 
      ####  
       ##   
       ##   
      ####  
     ###### 
    ########
  HOURGLASS
end
