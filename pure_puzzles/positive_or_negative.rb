require 'pry'

odd_count = 0
even_count = 0

10.times do
  print "Please input a number: "
  input_number = Integer(gets.chomp)

  if input_number % 2 == 0
    even_count += 1
  else
    odd_count += 1
  end
end

loop do
  print "Would you like the count of even or odd numbers? "
  desired_count = gets.chomp.downcase

  if desired_count == "even"
    puts "The number of even numbers is #{even_count}"
    break
  elsif desired_count == "odd"
    puts "The number of odd numbers is #{odd_count}"
    break
  end
end

