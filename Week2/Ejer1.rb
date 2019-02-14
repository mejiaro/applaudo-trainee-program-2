require 'time'
require 'date'
@goodDate ||= []
@badDate ||= []
@Total ||= 0
@secondline ||=[]
@number ||=[]
class String
  def red
    "\e[31m#{self}\e[0m"
  end
  def green
    "\e[32m#{self}\e[0m"
  end
  def brown
    "\e[33m#{self}\e[0m"
  end
end
def goodFileCreation(dates, name)
  File.open("#{name}.csv", 'w') do |csv|
    dates.sort_by! { |s| [s.year, s.month, s.day, s.hour, s.min, s.sec] }
    csv.puts 'Date in EST Zone'
    dates.each do |val|
      csv.puts val.to_s
    end
    csv.puts "\n\nGRAPHIC:"
    csv.print '╔'
    (60).times { csv.print '═' }
    csv.print "╗"
    csv.puts "\n║"
    csv.puts '║  ' + '■' *( dates.length*100/@Total/2) + " #{dates.length*100/@Total}% valid dates"
    csv.puts '║  '
    csv.puts '║  ' + '■' *(@badDate.length / 3*100/@Total/2) + " #{@badDate.length / 3*100/@Total}% invalid dates"
    csv.puts '║  '
    csv.print '║  '
    csv.puts "-"*52 +"%"
    csv.print '║  '
    (0..100).step(4).each do |index|
      @number = index.to_s.split('')
      @secondline << @number[1]
      csv.print "#{@number[0]} "
    end
    csv.print "\n║     "
    @secondline.each do |val|
      csv.print "#{val} "
    end
    csv.print "\n║"
    csv.print " "*52 +"0"
    csv.print "\n╚"
    (60).times { csv.print '═' }
    csv.print "╝"
  end
end

def wrongFileCreation(dates, name)
  File.open("#{name}.csv", 'w') do |csv|
    csv.puts 'Event,Invalid Date,Line Number'
    (0...dates.length).step(3).each do |index|
      csv.puts "#{dates[index]},#{dates[index + 1]},#{dates[index + 2]}"
    end
  end
end

def reader(name)
  fileArray = []
  @goodDate.clear
  @badDate.clear
  c = 1
  File.open("#{name}.csv", 'r') do |fl|
    while line = fl.gets
      fileArray = line.delete("\n").split(',')
      begin
        datetime = DateTime.strptime("#{fileArray[1]} CST", '%d/%m/%Y %H:%M:%S %Z')
        @goodDate << datetime.to_time.getlocal('-05:00')
      rescue ArgumentError => e
        @badDate << fileArray[0] << fileArray[1] << c
      ensure
        c += 1
      end
    end
  end

  (0...@badDate.length).step(3).each do |index|
    puts "The file has an invalid date in line #{@badDate[index + 2]}"
  end
rescue Errno::ENOENT => msg
  puts "Exception Class: #{msg.class.name}"
  puts "Exception Message: #{msg.message}"
  puts "Exception Backtrace: #{msg.backtrace}"
end

def safe(proc)
  proc.call
rescue Errno::ENOENT => msg
  puts "Exception Class: #{msg.class.name}"
  puts "Exception Message: #{msg.message}"
  puts "Exception Backtrace: #{msg.backtrace}"
rescue NameError => name
  puts "Exception Class: #{name.class.name}"
  puts "Exception Message: #{name.message}"
  puts "Exception Backtrace: #{name.backtrace}"
end

def graph(vDates, iDates)
  puts "\n\nGRAPHIC:"
  print '╔'.brown
  (60).times { print '═'.brown }
  print "╗".brown
  puts "\n║".brown
  print '║  '.brown
  print ('■' *(vDates/2)).green
  puts " #{vDates}% valid dates"
  puts '║  '.brown
  print '║  '.brown
  print ('■' *(iDates/2)).red
  puts " #{iDates}% invalid dates"
  puts '║  '.brown
  print '║  '.brown
  puts "-"*52 +"%"
  print '║  '.brown
  (0..100).step(4).each do |index|
    @number = index.to_s.split('')
    print "#{@number[0]} "
  end
  print "\n║     ".brown
  @secondline.each do |val|
    print "#{val} "
  end
  print "\n║".brown
  print " "*52 +"0"
  print "\n╚".brown
  (60).times { print '═'.brown }
  print "╝".brown
  puts
end

input = ''
goodFile = ''
badFile = ''
36.times { print '-' }
puts "\n|              Dates               |"
while goodFile == badFile || input == badFile || input == badFile
  36.times { print '-' }
  puts "\nType the name of the input file without the .csv:"
  input = gets.chomp
  puts 'Type the name of the file for the valid dates without the .csv:'
  goodFile = gets.chomp
  puts 'Type the name of the file for the invalid dates without the .csv:'
  badFile = gets.chomp
  next unless goodFile == badFile || input == badFile || input == badFile
  sleep(1)
  system('clear')
  puts 'The name of the 3 files must be different '
end
sleep(1)
system('clear')
reader(input)
@Total=(@badDate.length/3 + @goodDate.length).to_i
safe(proc { goodFileCreation(@goodDate, goodFile) })
safe(proc { wrongFileCreation(@badDate, badFile) })
graph(@goodDate.length*100/@Total, (@badDate.length / 3)*100/@Total)
