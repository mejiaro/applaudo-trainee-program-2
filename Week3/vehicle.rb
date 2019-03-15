require 'securerandom'

class Vehicle
  attr_accessor :color, :brand, :price, :id, :wheels
  def initialize(color, brand, price)
    @color = color
    @brand = brand
    @price = price.to_f
    @id = SecureRandom.hex
  end

  def self.vehicles_array
    @vehicles_array ||=[]
  end

  # shouldve used a builder for trucks and cars.
  def self.imports_cars(color,brand,price)
    (0...color.length).each do |index|
      c = self.new(color[index], brand[index], price[index])
      c.wheels
      Vehicle.vehicles_array << c
    end
  end
  def self.imports_trucks(color,brand,price,wheels)
    (0...color.length).each do |index|
      t = self.new(color[index], brand[index], price[index])
      t.wheels = wheels[index]
      Vehicle.vehicles_array << t
    end
  end
end
