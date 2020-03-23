class IndexError < StandardError
end

class FixedArray
  def initialize(size)
    @array = Array.new(size)
  end
  
  def []=(index, new_value)
    if valid_index?(index)
      array[index] = new_value
    else
      raise IndexError
    end
  end
  
  def [](index)
    if valid_index?(index)
      array[index]
    else
      raise IndexError
    end
  end
  
  def to_a
    array.clone
  end
  
  def to_s
    to_a.to_s
  end

  private

  attr_accessor :array
  
  def valid_index?(i)
    (i < @array.size) && (-i >= -(array.size))
  end
end

fixed_array = FixedArray.new(5)
puts fixed_array[3] == nil
puts fixed_array.to_a == [nil] * 5

fixed_array[3] = 'a'
puts fixed_array[3] == 'a'
puts fixed_array.to_a == [nil, nil, nil, 'a', nil]

fixed_array[1] = 'b'
puts fixed_array[1] == 'b'
puts fixed_array.to_a == [nil, 'b', nil, 'a', nil]

fixed_array[1] = 'c'
puts fixed_array[1] == 'c'
puts fixed_array.to_a == [nil, 'c', nil, 'a', nil]

fixed_array[4] = 'd'
puts fixed_array[4] == 'd'
puts fixed_array.to_a == [nil, 'c', nil, 'a', 'd']
puts fixed_array.to_s# == '[nil, "c", nil, "a", "d"]'

puts fixed_array[-1] == 'd'
puts fixed_array[-4] == 'c'

begin
  fixed_array[6]
  puts false
rescue IndexError
  puts true
end

begin
  fixed_array[-7] = 3
  puts false
rescue IndexError
  puts true
end

begin
  fixed_array[7] = 3
  puts false
rescue IndexError
  puts true
end