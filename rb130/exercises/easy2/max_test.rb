require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'max'

class MaxTest < Minitest::Test
  def test_max_by
    assert_equal(5, max_by([1, 5, 3]) { |value| value + 2 } )
    assert_equal(1, max_by([1, 5, 3]) { |value| 9 - value } )
    assert_equal(1, max_by([1, 5, 3]) { |value| (96 - value).chr } )
    assert_equal([3, 4, 5], max_by([[1, 2], [3, 4, 5], [6]]) { |value| value.size } )
    assert_equal(-7, max_by([-7]) { |value| value * 3 } )
    assert_equal(nil, max_by([]) { |value| value + 5 } )
  end 
end
