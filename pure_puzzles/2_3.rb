=begin
  Using only single character output statements that output a hash mark, a space, 
  or an end-of-line, write a program that produces the following shape:

    #            #
     ##        ## 
      ###    ###  
       ########   
       ########   
      ###    ###  
     ##        ## 
    #            #
=end

def star
  output = ""
  height = 8

  for row in 1..8
    indent = -(row - 4.5).abs + 3.5
    hashes = indent + 1
    spaces = height - 1 - indent - hashes

    output << " " * indent
    output << "#" * hashes
    output << " " * spaces
    output << " " * spaces
    output << "#" * hashes
    output << " " * indent
    output << "\n"
  end

  output
end
