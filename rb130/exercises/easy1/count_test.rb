require 'minitest/autorun'
require 'minitest/reporters'

Minitest::Reporters.use!

require_relative 'count'

class CountTest < Minitest::Test
  def test_count
    assert_equal(3, count([1,2,3,4,5]) { |value| value.odd? })
    assert_equal(2, count([1,2,3,4,5]) { |value| value % 3 == 1 })
    assert_equal(5, count([1,2,3,4,5]) { |value| true })
    assert_equal(0, count([1,2,3,4,5]) { |value| false })
    assert_equal(0, count([]) { |value| value.even? })
    assert_equal(2, count(%w(Four score and seven)) { |value| value.size == 5 })
  end
end
