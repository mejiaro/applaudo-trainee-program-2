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


end
