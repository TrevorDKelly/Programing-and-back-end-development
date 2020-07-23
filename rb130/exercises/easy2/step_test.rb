require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'step'

class StepTest < Minitest::Test
  def test_step
    output = <<~OUTPUT
      value = 1
      value = 4
      value = 7
      value = 10
    OUTPUT

    assert_output(output) { step(1,10,3) { |value| puts "value = #{value}" }}
    assert_equal([1,4,7,10], step(1,10,3) { |value| puts "value = #{value}" })
  end
end
