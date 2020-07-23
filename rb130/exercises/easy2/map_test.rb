require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!
require 'set'
require_relative 'map'

class MapTest < Minitest::Test
  def test_map
    assert_equal([1, 9, 36], map([1, 3, 6]) { |value| value**2 })
    assert_equal([], map([]) { |value| true })
    assert_equal([false, false, false, false], map(['a', 'b', 'c', 'd']) { |value| false })
    assert_equal(['A', 'B', 'C', 'D'], map(['a', 'b', 'c', 'd']) { |value| value.upcase })
    assert_equal([[1], [1, 2, 3], [1, 2, 3, 4]], map([1, 3, 4]) { |value| (1..value).to_a })
  end

  def test_map_hashes
    assert_equal({a:1, b:2, c:3}.map { |k, v| "key = #{k} Value = #{v}" },
                 map({a:1, b:2, c:3}) { |k, v| "key = #{k} Value = #{v}" })
    assert_equal(Set[1,2,3,4].map { |v| "Value = #{v}" },
                 map(Set[1,2,3,4]) { |v| "Value = #{v}" })
  end
end
