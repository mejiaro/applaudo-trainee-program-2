require_relative 'vehicle'
require_relative 'extras'

class Store
  def initialize(array_vehicle)
    @vehicles = []
    @vehicles.replace(array_vehicle)
  end

  def vehicles
    @vehicles ||= []
  end

  def add_vehicle(vec)
    repeated_vehicle = true
    (0...@vehicles.length).each do |index|
      repeated_vehicle = false if vec.id != @vehicles[index].id
    end
    if repeated_vehicle
      puts 'The Id of the vehicle is repeated'
    else
      @vehicles.push vec
      puts 'Vehicle added'
    end
  end

  def delete_vehicle(vehicle)
    vehicles.delete_if { |object| object.id == vehicle.id }
  end

  def print_vehicles
    36.times { print '-' }
    vehicles.each_with_index do |l, index|
      puts "#{index + 1}."
      if l.wheels > 4
        puts "\tType:  Truck"
      else
        puts "\tType:  Car"
      end
      puts "\t\tFeatures"
      puts "\t\tColor: #{l.color}"
      puts "\t\ttBrand: #{l.brand}"
      puts "\t\tWheels: #{l.wheels}"
      puts "\t\tPrice: $#{l.price}"
      36.times { print '-' }
      puts ''
    end
  end

  def print_extras
    36.times { print '-' }
    puts "\n|\t\tEXTRAS:            |"
    36.times { print '-' }
    puts ''
    Extras.extras_array.each_with_index do |l, index|
      puts "|\t#{index + 1}.- #{l.extra} ($#{l.price})"
    end
    36.times { print '-' }
    puts
  end

  def print_details(vehicle, extras = [])
    total = 0.0
    puts 'Detail:'
    puts "\t\tQuote for the car:  #{vehicle.id}"
    puts "\t\tFeatures"
    puts "\t\tColor: #{vehicle.color}"
    puts "\t\tBrand: #{vehicle.brand}"
    puts "\t\tWheels: #{vehicle.wheels}"
    puts "\t\tPrice: $#{vehicle.price}"
    total += vehicle.price
    40.times { print '-' }
    puts ''
    if extras.length>0
      extras.each do |l|
        puts "\t\t#{l.extra} ($#{l.price})"
        total += l.price
      end
    else
      puts "\t\tNo extras selected"
    end

    40.times { print '-' }
    puts "\n\t\tTotal: $#{total}"
  end
end
