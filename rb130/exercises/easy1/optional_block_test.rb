require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'optional_block'

class OptionalBlockTest < Minitest::Test
  def test_compute
    assert_equal(8, compute { 5 + 3 })
    assert_equal('ab', compute { 'a' + 'b'})
    assert_equal('Does not compute', compute)
  end
end
