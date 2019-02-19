require_relative 'vehicle'

class Car < Vehicle

  def wheels
    @wheels ||= 4
  end

  t = self.new("white","toyota","fasfsd","$105000")
  t.wheels=8
  Vehicle.array.push t
  t = self.new("black","toyota","fasfsd","$180000")
  t.wheels=6
  Vehicle.array.push t
end
