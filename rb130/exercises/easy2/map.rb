def map(arr)
  arr.each_with_object([]) { |element, arr| arr << yield(element) }
end
