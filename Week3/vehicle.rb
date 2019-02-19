require 'securerandom'

class Vehicle
  attr_accessor :color, :brand, :model,:price, :id, :wheels
  def initialize(color, brand, model, price)
    @color = color
    @brand = brand
    @model = model
    @price = price
    @@array = []
    @id = SecureRandom.hex
  end

  def self.array
    @@array ||=[]
  end
end
