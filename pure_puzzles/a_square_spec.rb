require "./a_square"

describe "A Square (Half of a Square Reduction)" do
  it "outputs a whole square" do
    output = square(height: 5)

    expect(output).to eq(SQUARE)
  end

  private

  SQUARE =  <<~SQUARE
    #####
    #####
    #####
    #####
    #####
  SQUARE
end
