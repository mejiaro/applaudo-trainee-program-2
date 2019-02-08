class Array
  def to_histogram
    b = self
    if b.empty?
      puts 'The array is empty'
    else
      puts b.each_with_object(Hash.new(0)) { |word, hash| hash[word] += 1 }
    end
  end
end

arr = []
op = 0
36.times { print '-' }
puts "\n|              Problem 2           |"
while op.to_i != 5
  36.times { print '-' }
  puts "\n|               Menu               |"
  36.times { print '-' }
  puts "\n| 1.Add number to array            |"
  puts '| 2.Print the array                |'
  puts '| 3.Calculate histogram            |'
  puts '| 4.Clear the array                |'
  puts '| 5.Exit                           |'
  36.times { print '-' }
  puts "\nType the number of the option:"
  op = gets.chomp
  case op.to_i
  when 1
    puts 'Type the number you like to add to the array'
    num = gets.chomp
    begin
      num = Integer(num)
      arr << num
      puts 'Number added correctly'
    rescue ArgumentError, TypeError
      puts 'Type a valid number'
    end
  when 2
    if arr.empty?
      puts 'The array is empty'
    else
      puts "The array is: #{arr}"
    end
  when 3
    arr.to_histogram
  when 4
    puts 'Are you sure you want to clear the array? (S/N)'
    q = gets.chomp
    if q.casecmp('s').zero?
      arr.clear
      puts 'Array cleared'
    else
      puts 'The array was not cleared'
    end
  when 5
    puts 'Leaving the program...'
  else
    puts 'The option is not valid'
  end
  sleep(1)
  system("clear")
end
