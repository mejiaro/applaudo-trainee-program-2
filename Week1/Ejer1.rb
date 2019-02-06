def PrintAlphabet(num)
  last ="z"*num
  abe = ("a"..last).to_a
  #abe.each {|l| print l +","}
  print abe.join(",")
  puts
end
25.times{ print "-"}
puts "\n|        Problem 1      |"
25.times{ print "-"}
puts "\nDigit the number of repetitions: "
n = gets.chomp
25.times{ print "-"}
puts
begin
  n = Integer(n)
    if(n>0 && n<6)
      PrintAlphabet(n)
    else
      puts "The number of repetitions is too high"
    end
  rescue ArgumentError, TypeError
    puts "Type a valid number"
end
