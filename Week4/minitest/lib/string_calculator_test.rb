require 'minitest/autorun'
require_relative 'string_calculator'

class StringCalculatorTest < Minitest::Test
  def test_given_empty_string
    string_calc= StringCalculator.new
    assert_equal(0,string_calc.add(''),"Returns zero")
  end
  def test_given_two_numbers
    string_calc= StringCalculator.new
    assert_equal(6,string_calc.add('2,4'),"Returns 6")
  end
  def test_given_more_than_one_digit
    string_calc= StringCalculator.new
    assert_equal(117,string_calc.add('17,100'),"Returns 117")
  end
end
