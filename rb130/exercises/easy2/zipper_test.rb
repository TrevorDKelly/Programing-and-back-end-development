require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'zipper'

class ZipperTest < Minitest::Test
  def test_zipper
    assert_equal([[1,4],[2,5],[3,6]], zip([1,2,3],[4,5,6]))
  end
end
