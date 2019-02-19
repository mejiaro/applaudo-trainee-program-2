require_relative 'vehicle'
require_relative 'car'
require_relative 'truck'

a=[]
truck=[]
car=[]
a.replace(Vehicle.array)
a.each do |l|
  if l.wheels > 4
    truck.push a
  else
    car.push a
  end
end
puts truck.length
truck.each do |l|
  puts "ID #{l.id}"
  puts "Color #{l.color}"
end
