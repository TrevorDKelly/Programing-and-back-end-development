require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'drop'

class DropTest < Minitest::Test
  def test_drop
    assert_equal([6], drop_while([1, 3, 5, 6]) { |value| value.odd? }) 
    assert_equal([1, 3, 5, 6], drop_while([1, 3, 5, 6]) { |value| value.even? }) 
    assert_equal([], drop_while([1, 3, 5, 6]) { |value| true }) 
    assert_equal([1, 3, 5, 6], drop_while([1, 3, 5, 6]) { |value| false }) 
    assert_equal([5, 6], drop_while([1, 3, 5, 6]) { |value| value < 5 }) 
    assert_equal([], drop_while([]) { |value| true }) 
  end
end
