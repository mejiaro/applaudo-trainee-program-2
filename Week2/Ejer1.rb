require 'time'
require 'date'
@goodDate ||= []
@badDate ||= []
class String
def red;            "\e[31m#{self}\e[0m" end
def green;          "\e[32m#{self}\e[0m" end
def brown;          "\e[33m#{self}\e[0m" end
end
def goodFileCreation(dates, name)
  File.open("#{name}.csv", 'w') do |csv|
    dates.sort_by! { |s| [s.year, s.month, s.day, s.hour, s.min, s.sec] }
    csv.puts 'Date in EST Zone'
    dates.each do |val|
      csv.puts val.to_s
    end
    csv.puts "\n\nGRAPHIC:"
    csv.print "╔"
    ((@badDate.length/3+ dates.length)*2).times { csv.print '═' }
    csv.puts "\n║"
    csv.puts '║  ' + '■ ' * dates.length + " #{dates.length} valid dates"
    csv.puts "║  "
    csv.puts '║  ' + '■ ' * (@badDate.length/3) + " #{@badDate.length/3} invalid dates"
    csv.puts "║  "
    csv.print "╚"
    ((@badDate.length/3+ dates.length)*2).times { csv.print '═' }
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

def reader
  fileArray = []
  @goodDate.clear
  @badDate.clear
  c = 1
  File.open('events.csv', 'r') do |fl|
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
  print ("╔").brown
  ((vDates + iDates)*2).times { print ('═').brown }
  puts ("\n║").brown
  print ('║  ').brown
  print ('■ ' * vDates).green
  puts " #{vDates} valid dates"
  puts ("║  ").brown
  print ('║  ').brown
  print ('■ ' * iDates).red
  puts " #{iDates} invalid dates"
  puts ('║  ').brown
  print ("╚").brown
  ((vDates + iDates)*2).times { print ('═').brown }
  puts
end

reader
safe(proc { goodFileCreation(@goodDate, 'GoodDate') })
safe(proc { wrongFileCreation(@badDate, 'BadDate') })
graph(@goodDate.length, (@badDate.length / 3))
