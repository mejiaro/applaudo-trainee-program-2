require_relative 'vehicle'
require_relative 'car'
require_relative 'truck'
require_relative 'store'
require_relative 'extras'

@extras_list = []
color = ''
price = 0
brand = ''
wheels = 0
vehicle_number = 0
list = ''
q=''
@store = Store.new(Vehicle.vehicles_array)
def get_extras(array_select)
  array_select.uniq.each do |l|
    begin
      if l.to_i > 0 && l.to_i <= Extras.extras_array.length
        @extras_list << Extras.extras_array[l.to_i - 1]
      end
    rescue ArgumentError => e
      puts e.backtrace
      puts e.message
      puts 'Type a valid input'
      puts 'Type any key to return to the menu'
      gets.chomp
    rescue TypeError => m
      puts m.message
    end
  end
end

def new_car(color, brand, price)
  price = Float(price)
  c = Car.new(color, brand, price)
  c.wheels
  @store.add_vehicle(c)
end

def new_truck(color, brand, price, wheels)
  wheels = Integer(wheels)
  price = Float(price)
  t = Truck.new(color, brand, price)
  t.wheels = wheels
  @store.add_vehicle(t)
end

def safe(proc)
  proc.call
rescue ArgumentError => e
  puts e.backtrace
  puts e.message
  puts 'Type a valid input'
  puts 'Type any key to return to the menu'
  gets.chomp
end
op = 0

36.times { print '-' }
puts "\n|           Car sales Store        |"
while op.to_i != 6
  36.times { print '-' }
  puts "\n|               Menu               |"
  36.times { print '-' }
  puts "\n| 1.Add new vehicle                |"
  puts '| 2.Delete a vehicle               |'
  puts '| 3.Print the list of vehicles     |'
  puts '| 4.Print the list of extras       |'
  puts '| 5.Buy a Car                      |'
  puts '| 6.Exit                           |'
  36.times { print '-' }
  puts "\nType the number of the option:"
  op = gets.chomp
  case op.to_i
  when 1
    puts 'Type the brand of the vehicle'
    brand = gets.chomp
    puts 'Type the color of the vehicle'
    color = gets.chomp
    puts 'Type the price of the vehicle'
    price = gets.chomp
    puts 'Type the number of wheels of the vehicle'
    wheels = gets.chomp
    if wheels.to_i > 4
      safe(proc { new_truck(color, brand, price, wheels) })
    else
      safe(proc { new_car(color, brand, price) })
    end
  when 2
    if @store.vehicles.empty?
      puts 'There are no vehicles to delete'
    else
      puts 'Type the number of the vehicle'
      vehicle_number = gets.chomp
      if vehicle_number.to_i > 0
        puts 'Are you sure you want to delete the vehicle? (S/N)'
        q = gets.chomp
        if q.casecmp('s').zero?
          @store.delete_vehicle(@store.vehicles[(vehicle_number.to_i - 1)])
          puts 'The vehicle was deleted'
        else
          puts 'The vehicle was not deleted'
        end

      else
        puts 'The number of the vehicle is not valid'
      end
    end
  when 3
    @store.print_vehicles
    puts 'Press any key to continue'
    gets.chomp
  when 4
    @store.print_extras
    puts 'Press any key to continue'
    gets.chomp
  when 5
    puts 'Type the number of the vehicle'
    vehicle_number = gets.chomp
    if vehicle_number.to_i > 0 && vehicle_number.to_i <= @store.vehicles.length
      puts 'Type the numbers of extras separated by ,'
      list = gets.chomp
      get_extras(list.split(','))
      @store.print_details(@store.vehicles[vehicle_number.to_i - 1], @extras_list)
      puts 'Press any key to continue'
      gets.chomp
    else
      puts 'The number of that car is not in the store'
    end
  when 6
    puts 'Leaving the program...'
  else
    puts 'The option is not valid'
  end
  sleep(1)
  system('clear')
end
