require 'minitest/autorun'
require 'minitest/reporters'

Minitest::Reporters.use!

require_relative 'divisors'

class DivisorsTest < Minitest::Test
  def test_possible_endings
    assert_equal([0,1,2,3,4,5,6,7,8,9], possible_endings(0))
    assert_equal([1,3,7,9], possible_endings(1))
    assert_equal([1,2,3,4,6,7,8,9], possible_endings(2))
    assert_equal([1,3,7,9], possible_endings(3))
    assert_equal([1,2,4,6,7,8,9], possible_endings(4))
    assert_equal([1,3,5,7,9], possible_endings(5))
    assert_equal([1,2,3,4,6,7,8,9], possible_endings(6))
    assert_equal([1,7,9], possible_endings(7))
    assert_equal([1,2,3,4,6,7,8,9], possible_endings(8))
    assert_equal([1,3,7,9], possible_endings(9))
  end

  def test_find_differences
    assert_equal([1,1,1,1,1,1,1,1,1,1], find_differences(0))
    assert_equal([2,4,2,2], find_differences(1))
    assert_equal([1,1,1,2,1,1,1,2], find_differences(2))
    assert_equal([2,4,2,2], find_differences(3))
    assert_equal([1,2,2,1,1,1,2], find_differences(4))
    assert_equal([2,2,2,2,2], find_differences(5))
    assert_equal([1,1,1,2,1,1,1,2], find_differences(6))
    assert_equal([6,2,2], find_differences(7))
    assert_equal([1,1,1,2,1,1,1,2], find_differences(8))
    assert_equal([2,4,2,2], find_differences(9))
  end

  def test_next_to_add
    differences = [1,2,3,4,5]
    x = next_to_add(differences)
    assert_equal(1, x)
    assert_equal([2,3,4,5,1], differences)
  end

  def test_divisors
    #assert_equal([1], divisors(1))
    assert_equal([1,7], divisors(7))
    assert_equal([1,2,3,4,6,12], divisors(12))
    assert_equal([1,2,7,14,49,98], divisors(98))
    assert_equal([1,999979,999983,999962000357], divisors(999962000357))
  end
end
