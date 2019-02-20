require_relative 'vehicle'

class Car < Vehicle

  def wheels
    @wheels ||= 4
  end

  car_color = %w[black white blue gray blue]
  car_brand = %w[Toyota Nissan Hyundai Toyota Honda]
  car_price = [80_000, 75_000, 78_000, 90_000, 95_000]

  (0...car_color.length).each do |index|
    c = self.new(car_color[index], car_brand[index], car_price[index])
    c.wheels
    vehicles_array << c
  end
end
