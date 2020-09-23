class CircularBuffer
  class BufferException < StandardError
  end

  class BufferFullException < BufferException
  end

  class BufferEmptyException < BufferException
  end

  def initialize(size)
    @buffer = []
    @max_size = size
  end

  def write(new)
    raise CircularBuffer::BufferFullException if @buffer.size >= @max_size
    @buffer << new unless new.nil?
  end

  def write!(new)
    return if new.nil?
    read if @buffer.size >= @max_size
    write(new)
  end

  def read
    raise CircularBuffer::BufferEmptyException if @buffer.empty?
    @buffer.shift
  end

  def clear
    @buffer = []
  end
end

# create a buffer of a given size
# read pulls the first item in the buffer
#   removes it and retrns it
#   error if empty
# write
#   adds to end of buffer
#   exception if buffer is full
# write!
#   adds to end of buffer
#   removes first if full + 1
# clear
#   removes all items in buffer
# nil can not be added
#
# questions
#   return values of write and clear
#   error clearing empty buffer?
#
# array
#   check size before adding
#
# clear
#   buffer = []
# read
#   exception if empty
#   remove and return first - shift
# write
#   exception if buffer size == max size
#   add to end
# write
#   if bufer size is max size then remove first
#   add to end

