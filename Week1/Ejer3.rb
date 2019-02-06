def mean(array)
  if(array.length==0)
    puts "The array is empty"
  else
    m=0
    array.each {|l| m=m+l}
    puts "Mean is #{(m.to_f/array.length).round(2)}"
  end
end

def median(array)
  if(array.length==0)
    puts "The array is empty"
  else
    h = array.each_with_object(Hash.new(0)) {|word, hash| hash[word] += 1}
    puts "Median is #{h.key(h.values.max).to_s}"
  end
end

def mode(array)
  mo=array.length
  if(mo==0)
    puts "The array is empty"
  else
    array.sort! { |a, b| a <=> b }
    if(mo%2==0)
      puts "Mode is #{(array[mo/2]+array[(mo/2)-1]).to_f/2}"
    else
      puts "Mode is #{array[mo/2]}"
    end
  end
end

arr=[]
op=0
36.times{ print "-"}
puts "\n|              Problem 2           |"
while op.to_i!=8 do
  36.times{ print "-"}
  puts "\n|               Menu               |"
  36.times{ print "-"}
  puts "\n| 1.Add number to array            |"
  puts "| 2.Print the array                |"
  puts "| 3.Calculate mean                 |"
  puts "| 4.Calculate median               |"
  puts "| 5.Calculate mode                 |"
  puts "| 6.Calculate mean, mode an median |"
  puts "| 7.Clear the array                |"
  puts "| 8.Exit                           |"
  36.times{ print "-"}
  puts "\nType the number of the option:"
  op= gets.chomp

  case op.to_i
  when 1
    puts "Type the number you like to add to the array"
    num=gets.chomp
    begin
    num = Integer(num)
    arr << num
    puts "Number added correctly"
    rescue ArgumentError, TypeError
    puts "Type a valid number"
    end
  when 2
    if arr.length==0
      puts "The array is empty"
    else
      puts "The array is: #{arr}"
    end
  when 3
    mean(arr)
  when 4
    median(arr)
  when 5
    mode(arr)
  when 6
    mean(arr)
    median(arr)
    mode(arr)
  when 7
    puts "Are you sure you want to erase the array? (S/N)"
    q=gets.chomp
    if(q.downcase=="s")
      arr.clear
      puts "Array eliminated"
    end
  when 8
    puts "Leaving the program..."
  else
    puts "The option is not valid"
  end
end
