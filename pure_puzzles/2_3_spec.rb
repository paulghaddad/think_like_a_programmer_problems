require "./2_3"

describe "Problem 2.3" do
  it "outputs an X" do
    shape = star

    expect(shape).to eq(STAR)
  end

  private

  STAR = <<~STAR
    #            #
     ##        ## 
      ###    ###  
       ########   
       ########   
      ###    ###  
     ##        ## 
    #            #
  STAR
end
