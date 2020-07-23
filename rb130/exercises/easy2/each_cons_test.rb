require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'each_cons'

class EachConsTest < Minitest::Test
  def test_each_cons
    hash = {}
    result = each_cons([1, 3, 6, 10]) do |value1, value2|
      hash[value1] = value2
    end
    assert_equal({ 1 => 3, 3 => 6, 6 => 10 }, hash)
    assert_nil(result) 

    hash = {}
    result = each_cons([]) do |value1, value2|
      hash[value1] = value2
    end
    assert_equal({}, hash)
    assert_nil(result) 

    hash = {}
    result = each_cons(['a', 'b']) do |value1, value2|
      hash[value1] = value2
    end
    assert_equal({'a' => 'b'}, hash)
    assert_nil(result) 
  end

  def test_each_cons_step_by
    hash = {}
    each_cons([1, 3, 6, 10], 1) do |value|
      hash[value] = true
    end
    assert_equal({ 1 => true, 3 => true, 6 => true, 10 => true }, hash)

    hash = {}
    each_cons([1, 3, 6, 10], 2) do |value1, value2|
      hash[value1] = value2
    end
    assert_equal({ 1 => 3, 3 => 6, 6 => 10 }, hash)

    hash = {}
    each_cons([1, 3, 6, 10], 3) do |value1, *values|
      hash[value1] = values
    end
    assert_equal({ 1 => [3, 6], 3 => [6, 10] }, hash)

    hash = {}
    each_cons([1, 3, 6, 10], 4) do |value1, *values|
      hash[value1] = values
    end
    assert_equal({ 1 => [3, 6, 10] }, hash)

    hash = {}
    each_cons([1, 3, 6, 10], 5) do |value1, *values|
      hash[value1] = values
    end
    assert_equal({}, hash)
  end
end
