require "./a_line"

describe "A line" do
  it "outputs a line" do
    output = a_line(length: 5)

    expect(output).to eq("#####\n")
  end
end
