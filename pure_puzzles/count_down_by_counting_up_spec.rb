require "./count_down_by_counting_up"

describe "Count Down By Counting Up" do
  it "prints out the numbers 5 to 1" do
    expect(count_down(5)).to eq("5\n4\n3\n2\n1\n")
  end
end
