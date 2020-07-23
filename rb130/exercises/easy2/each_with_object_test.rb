require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'each_with_object'

class EachWithObjectTest < Minitest::Test
  def test_each_with_object
    result = each_with_object([1, 3, 5], []) do |value, list|
      list << value**2
    end
    assert_equal([1, 9, 25], result)

    result = each_with_object([1, 3, 5], []) do |value, list|
      list << (1..value).to_a
    end
    assert_equal([[1], [1, 2, 3], [1, 2, 3, 4, 5]], result)

    result = each_with_object([1, 3, 5], {}) do |value, hash|
      hash[value] = value**2
    end
    assert_equal({ 1 => 1, 3 => 9, 5 => 25 }, result)

    result = each_with_object([], {}) do |value, hash|
      hash[value] = value * 2
    end
    assert_equal({}, result)
  end
end
