require_relative 'vehicle'

class Car < Vehicle
  def wheels
    @wheels ||= 4
  end

  car_color = %w[black white blue gray blue]
  car_brand = %w[Toyota Nissan Hyundai Toyota Honda]
  car_price = [8000, 700, 7000, 9000, 5000]
  imports_cars(car_color, car_brand, car_price)
end
