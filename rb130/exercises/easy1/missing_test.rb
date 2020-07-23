require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'missing'

class MissingTest < Minitest::Test
  def test_missing
    assert_equal([-1, 0, 2, 3, 4], missing([-3, -2, 1, 5]))
    assert_equal([], missing([1,2,3,4]))
    assert_equal([2,3,4], missing([1,5]))
    assert_equal([], missing([6]))
    assert_equal([], missing([]))
  end
end
