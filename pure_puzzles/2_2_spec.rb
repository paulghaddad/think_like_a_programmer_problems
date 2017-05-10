require "./2_2"

describe "Problem 2.2" do
  it "outputs an upside down triangle" do
    shape = upside_down_triangle(height: 8)

    expect(shape).to eq(UPSIDE_DOWN_TRIANGLE)
  end

  private

  UPSIDE_DOWN_TRIANGLE = <<~UPSIDE_DOWN_TRIANGLE
       ##   
      ####  
     ###### 
    ########
    ########
     ###### 
      ####  
       ##   
  UPSIDE_DOWN_TRIANGLE
end
