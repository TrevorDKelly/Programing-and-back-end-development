class Series
  def initialize(number)
    @number = number
  end

  def slices(chunk_size)
    raise ArgumentError if chunk_size > @number.size

    arr = []
    (0..(@number.size - chunk_size)).each do |i|
      chunk = @number[i..(i + chunk_size - 1)]
      chunk = chunk.split('').map(&:to_i)
      arr << chunk
    end

    arr
  end
end

# get num
# have number as a string
# return nested array
#   of ints
# 
# error if size is > number size
# 
# arr = []
# 0..num size - chunk size
#   string[i..i+chunk size]
#   split and to i
#   add to arr
# return arr
