require "./2_1"

describe "Problem 2.1" do
  it "outputs an upside down triangle" do
    shape = upside_down_triangle(height: 4)

    expect(shape).to eq(UPSIDE_DOWN_TRIANGLE)
  end

  private

  UPSIDE_DOWN_TRIANGLE = <<~UPSIDE_DOWN_TRIANGLE
    ########
     ###### 
      ####  
       ##   
  UPSIDE_DOWN_TRIANGLE
end
