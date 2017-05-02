require "./a_sideways_triangle"

describe "A Sideways Triangle" do
  it "is rotated to the right" do
    triangle = sideways_triangle(height: 4)

    expect(triangle).to eq(TRIANGLE)
  end

  private

  TRIANGLE = <<~TRIANGLE
    #
    ##
    ###
    ####
    ###
    ##
    #
  TRIANGLE
end
