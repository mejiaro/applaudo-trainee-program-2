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
      puts 'Vehicle added correctly'
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
      puts "\t\tPrice: $#{sprintf('%.2f', l.price)}"
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
      puts "|\t#{index + 1}.- #{l.extra} ($#{sprintf('%.2f', l.price)})"
    end
    36.times { print '-' }
    puts
  end

  def print_details(vehicle, extras = [])
    total = 0.0
    36.times { print '-' }
    puts "\nDetail:"
    puts "\tQuote for the car:  #{vehicle.id}"
    puts "\tFeatures"
    puts "\tColor: #{vehicle.color}"
    puts "\tBrand: #{vehicle.brand}"
    puts "\tWheels: #{vehicle.wheels}"
    puts "\tPrice: $#{sprintf('%.2f', vehicle.price)}"
    total += vehicle.price
    40.times { print '-' }
    puts ''
    if extras.length>0
      extras.each do |l|
        puts "\t#{l.extra} ($#{sprintf('%.2f', l.price)})"
        total += l.price
      end
    else
      puts "\tNo extras selected"
    end

    40.times { print '-' }
    puts "\n\tTotal: $#{sprintf('%.2f', total)}"
  end
end
