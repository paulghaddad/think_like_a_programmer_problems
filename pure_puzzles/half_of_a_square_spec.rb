require "./half_of_a_square"

describe "Half of a Square" do
  it "outputs half of a square in hashes" do
    output = half_of_a_square(height: 5)

    expect(output).to eq(HALF_SQUARE)
  end

  private

  HALF_SQUARE = <<~HALF_SQUARE
    #####
    ####
    ###
    ##
    #
  HALF_SQUARE
end
