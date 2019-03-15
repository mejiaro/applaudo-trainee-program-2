require_relative 'vehicle'
require_relative 'extras'

class Store
  def initialize(array_vehicle)
    @vehicles = array_vehicle
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
    puts
    vehicles.each_with_index do |vehicle, index| # use more descriptive variable names
      print "#{index + 1}."
      puts "\tType:  #{vehicle.class.to_s}" # class type tells you want kind of vehicle it is.
      puts "\t\tFeatures"
      puts "\t\tColor: #{vehicle.color}"
      puts "\t\tBrand: #{vehicle.brand}"
      puts "\t\tWheels: #{vehicle.wheels}"
      puts "\t\tPrice: $#{format('%.2f', vehicle.price)}"
      36.times { print '-' }
      puts ''
    end
  end

  def print_extras
    36.times { print '-' }
    puts "\n|\t\tEXTRAS:            |"
    36.times { print '-' }
    puts ''
    Extras.extras_array.each_with_index do |extra, index|
      puts "|\t#{index + 1}.- #{extra.extra} ($#{format('%.2f', extra.price)})"
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
    puts "\tPrice: $#{format('%.2f', vehicle.price)}"
    total += vehicle.price
    40.times { print '-' }
    puts ''
    if !extras.empty?
      extras.each do |l|
        puts "\t#{l.extra} ($#{format('%.2f', l.price)})"
        total += l.price
      end
    else
      puts "\tNo extras selected"
    end

    40.times { print '-' }
    puts "\n\tTotal: $#{format('%.2f', total)}"
  end
end
