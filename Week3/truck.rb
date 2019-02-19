require_relative 'vehicle'

class Truck < Vehicle
  def wheels=(value)
    value = 6 if value.to_i < 6
    @wheels = value
  end

#@@array << self
t = self.new("yellow","toyota","fasfsd","$100000")
t.wheels=8
Vehicle.array.push t
t = self.new("yellow","toyota","fasfsd","$100000")
t.wheels=6
Vehicle.array.push t
end
