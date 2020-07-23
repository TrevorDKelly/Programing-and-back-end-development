require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class NoExperienceError < StandardError; end

class Employee
  def hire
    raise NoExperienceError
  end
end

class AssertionsTest < Minitest::Test
  def setup
    @value = 5
    @list = ['xyz']
    @employee = Employee.new
    @num = Numeric.new
  end
  
  def test_assert
    skip
    assert(@value.odd?, 'The value is not odd')
  end

  def test_downcase
    skip
    assert_equal('xyz', @value.downcase)
  end

  def test_nil
    skip
    assert_nil(@value)
  end

  def test_empty
    skip
    assert_empty(@list)
  end

  def test_include
    assert_includes(@list, 'xyz')
  end

  def test_error
    assert_raises(NoExperienceError) { @employee.hire}
  end

  def test_instance_of
    assert_instance_of(Numeric, @num)
  end

  def test_kind_of
    assert_kind_of(Numeric, @value)
  end

  def test_same
    skip
    assert_same(@list.process, @list)
  end

  def test_refute
    refute_includes(@list, 'trevor')
  end
end
