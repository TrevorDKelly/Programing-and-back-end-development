require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'text'

class TextTest < Minitest::Test
  def setup
    @file = File.open('text.txt')
  end

  def test_swap
    text = @file.read
    a_count = text.count('a')
    e_count = text.count('e')
    swapped_e_count = a_count + e_count
    obj = Text.new(text)

    new_text = obj.swap('a', 'e')
    
    assert_equal(swapped_e_count, new_text.count('e'))
    assert_equal(0, new_text.count('a'))
    assert_equal(text.size, new_text.size)
  end

  def test_word_count
    text = @file.read
    words = text.split.count
    obj = Text.new(text)

    assert_equal(words, obj.word_count)
  end

  def teardown
    @file.close
  end
end

