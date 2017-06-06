require "./2_1"

describe "Problem 2.1" do
  it "outputs an upside down triangle" do
    shape = half_upside_down_triangle(height: 4)

    expect(shape).to eq(HALF_UPSIDE_DOWN_TRIANGLE)
  end

  private

  HALF_UPSIDE_DOWN_TRIANGLE = <<~HALF_UPSIDE_DOWN_TRIANGLE
    ########
     ###### 
      ####  
       ##   
  HALF_UPSIDE_DOWN_TRIANGLE
end
