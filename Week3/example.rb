require_relative 'vehicle'
require_relative 'car'
require_relative 'truck'
require_relative 'store'

a=[]
truck=[]
car=[]
puts "Number of vehicles #{Vehicle.vehicles_array.length}"
Vehicle.vehicles_array.each do |l|
  puts "ID:  #{l.id}"
  puts "Brand: #{l.brand}"
  puts "Model: #{l.model}"
  puts "Color: #{l.color}"
  puts "Price: $#{l.price}"
end


store = Store.new(Vehicle.vehicles_array)
c = Car.new("black", "Nissan", "Versa", 10000)
c.wheels
store.add_vehicle(c)

store.vehicles.each do |l|
  puts "ID:  #{l.id}"
  puts "Brand: #{l.brand}"
  puts "Model: #{l.model}"
  puts "Color: #{l.color}"
  puts "Price: $#{l.price}"
end

store.delete_vehicle(Vehicle.vehicles_array[4])
store.vehicles.each do |l|
  if l.wheels > 4
    puts "Truck"
  else
    puts "Car"
  end
  puts "ID:  #{l.id}"
  puts "Brand: #{l.brand}"
  puts "Model: #{l.model}"
  puts "Color: #{l.color}"
  puts "Price: $#{l.price}"
  puts "Wheels: #{l.wheels}"
  puts "--------------------\n"
end
puts store.vehicles.length
