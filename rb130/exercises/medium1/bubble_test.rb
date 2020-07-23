require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'bubble'

class BubbleTest < Minitest::Test
  def test_bubble
    array = [5, 3]
    assert_equal([3, 5], bubble_sort!(array))

    array = [6, 2, 7, 1, 4]
    assert_equal([1, 2, 4, 6, 7], bubble_sort!(array))

    array = %w(sue Pete alice Tyler rachel Kim bonnie)
    assert_equal(%w(Kim Pete Tyler alice bonnie rachel sue), bubble_sort!(array))
    
  end
  
  def test_bubble_with_block
    array = [5, 3, 7]
    assert_equal([7, 5, 3], bubble_sort!(array) { |first, second| first >= second })
    
    array = [6, 12, 27, 22, 14]
    assert_equal([14, 22, 12, 6, 27], bubble_sort!(array) { |first, second| (first % 7) <= (second % 7) })
    
    array = %w(sue Pete alice Tyler rachel Kim bonnie)
    assert_equal(%w(alice bonnie Kim Pete rachel sue Tyler), bubble_sort!(array) { |first, second| first.downcase <= second.downcase })
  end   
end
