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
    @@vehicles_array ||=[]
  end
end
