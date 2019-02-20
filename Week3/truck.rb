require_relative 'vehicle'

class Truck < Vehicle
  def wheels=(quantity)
    quantity = 6 if quantity < 6
    @wheels = quantity.to_i
  end

  truck_color = %w[black white blue gray blue]
  truck_brand = ['MAN', 'DAF', 'Iveco', 'Mercedez Benz', 'Volvo']
  truck_price = [80_000, 75_000, 78_000, 90_000, 95_000]
  truck_wheels = [8, 12, 12, 10, 4]

  (0...truck_color.length).each do |index|
    t = self.new(truck_color[index], truck_brand[index],truck_price[index])
    t.wheels = truck_wheels[index]
    vehicles_array << t
  end
end
