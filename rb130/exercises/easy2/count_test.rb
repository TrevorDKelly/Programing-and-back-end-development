require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'count'

class CountTest < Minitest::Test
  def test_count
    assert_equal(2, count(1, 3, 6) { |value| value.odd? }) 
    assert_equal(1, count(1, 3, 6) { |value| value.even? }) 
    assert_equal(0, count(1, 3, 6) { |value| value > 6 }) 
    assert_equal(3, count(1, 3, 6) { |value| true }) 
    assert_equal(0, count() { |value| true }) 
    assert_equal(3, count(1, 3, 6) { |value| value - 6 }) 
  end
end
