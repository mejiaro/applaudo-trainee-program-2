class Extras
  attr_accessor :extra, :price
  def initialize(extra, price)
    @extra = extra
    @price = price.to_i
  end

  def self.extras_array
    @@extras_array ||= []
  end

  extras = ['Radio', 'AC', 'Sunroof', 'Leather seats', 'Power windows']
  price = [70, 450, 800, 1500, 600]

  (0...extras.length).each do |index|
    extra = self.new(extras[index], price[index])
    extras_array << extra
  end
end
