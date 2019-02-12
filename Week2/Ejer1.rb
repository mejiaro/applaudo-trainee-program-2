require 'date'
require 'time'
def FileCreation(dates,name)
  File.open("#{name}.csv", 'w') do |csv|
    dates.each_with_index do |val, index|
      if index.odd?
        csv.puts "#{val}"
      else
        csv.print "#{val},"
      end
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
       end
     else
       event = a[index]
     end
   end

   puts "The file has #{counter} wrong dates"
rescue Exception => msg
  # # dispone el mensaje de error
  puts "Exception Class: #{msg.class.name}"
  puts "Exception Message: #{msg.message}"
  puts "Exception Backtrace: #{msg.backtrace}"
 end

 FileCreation(goodDate,"GoodDate")
 FileCreation(badDate,"BadDate")
