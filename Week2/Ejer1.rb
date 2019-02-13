require 'date'
require 'time'
def goodFileCreation(dates, name)
  File.open("#{name}.csv", 'w') do |csv|
    dates.each_with_index do |val, index|
      if index.odd?
        csv.puts val.to_s
      else
        csv.print "#{val},"
      end
    end
  end
end

def wrongFileCreation(dates, name)
  File.open("#{name}.csv", 'w') do |csv|
    (0...dates.length).step(3).each do |index|
      csv.puts "#{dates[index]}, #{dates[index + 1]},#{dates[index + 2]}"
    end
  end
end

begin
   format = '%d/%m/%Y %H:%M:%S'
   a = []
   b = []
   counter = 0
   errors = []
   goodDate = []
   badDate = []
   event = ''
   File.open('events.csv', 'r') do |fl|
     while line = fl.gets
       b = line.delete("\n").split(',')
       (a << b).flatten!
     end
   end
   puts a.length
   a.each_with_index do |val, index|
     if index.odd?
       begin
         datetime = DateTime.strptime(val, format)
         a[index] = (Time.parse datetime.to_s) + Time.zone_offset('EST')
         goodDate << event
         goodDate << a[index]
       rescue Exception => e
         counter += 1
         errors << ((index + 1) / 2)
         badDate << event
         badDate << val
         badDate << ((index + 1) / 2)
       end
     else
       event = a[index]
     end
   end

   puts "The file has #{counter} wrong dates"
rescue Exception => msg
  puts "Exception Class: #{msg.class.name}"
  puts "Exception Message: #{msg.message}"
  puts "Exception Backtrace: #{msg.backtrace}"
 end

goodFileCreation(goodDate, 'GoodDate')
wrongFileCreation(badDate, 'BadDate')
