require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'each_with_index'

class EachWithIndexTest < Minitest::Test
  def test_each_with_index
    block = []
    result = each_with_index([1, 3, 6]) do |value, index|
      block << [index, value]
    end
    
    assert_equal(result, [1, 3, 6] )
    assert_equal(block, [[0, 1],[1,3],[2,6]])
  end
end
