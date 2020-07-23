require 'minitest/autorun'
require 'minitest/reporters'

Minitest::Reporters.use!

require_relative 'iterators'

class IteratorsTest < Minitest::Test
  def test_any?
    assert_equal(true, any?([1, 3, 5, 6]) { |value| value.even? }) 
    assert_equal(false, any?([1, 3, 5, 7]) { |value| value.even? }) 
    assert_equal(false, any?([2, 4, 6, 8]) { |value| value.odd? }) 
    assert_equal(true, any?([1, 3, 5, 7]) { |value| value % 5 == 0 }) 
    assert_equal(true, any?([1, 3, 5, 7]) { |value| true }) 
    assert_equal(false, any?([1, 3, 5, 7]) { |value| false }) 
    assert_equal(false, any?([]) { |value| true }) 
  end

  def test_all?
    assert_equal(false, all?([1, 3, 5, 6]) { |value| value.odd? }) 
    assert_equal(true, all?([1, 3, 5, 7]) { |value| value.odd? }) 
    assert_equal(true, all?([2, 4, 6, 8]) { |value| value.even? }) 
    assert_equal(false, all?([1, 3, 5, 7]) { |value| value % 5 == 0 }) 
    assert_equal(true, all?([1, 3, 5, 7]) { |value| true }) 
    assert_equal(false, all?([1, 3, 5, 7]) { |value| false }) 
    assert_equal(true, all?([]) { |value| false }) 
  end

  def test_none?
    assert_equal(false, none?([1, 3, 5, 6]) { |value| value.even? }) 
    assert_equal(true, none?([1, 3, 5, 7]) { |value| value.even? }) 
    assert_equal(true, none?([2, 4, 6, 8]) { |value| value.odd? }) 
    assert_equal(false, none?([1, 3, 5, 7]) { |value| value % 5 == 0 }) 
    assert_equal(false, none?([1, 3, 5, 7]) { |value| true }) 
    assert_equal(true, none?([1, 3, 5, 7]) { |value| false }) 
    assert_equal(true, none?([]) { |value| true }) 
  end

  def test_one?
    assert_equal(true, one?([1, 3, 5, 6]) { |value| value.even? })
    assert_equal(false, one?([1, 3, 5, 7]) { |value| value.odd? })     
    assert_equal(false, one?([2, 4, 6, 8]) { |value| value.even? })    
    assert_equal(true, one?([1, 3, 5, 7]) { |value| value % 5 == 0 })  
    assert_equal(false, one?([1, 3, 5, 7]) { |value| false })     
    assert_equal(false, one?([]) { |value| true })
  end
end

