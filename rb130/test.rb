def reduce(collection, total = nil, &block)
  if total == nil
    reduce(collection[1..-1], collection[0], &block)
  else
    collection.each do |element|
      total = yield(total, element)
    end
    total
  end
end

p reduce(['a', 'b', 'c']) { |acc, value| acc += value }     # => 'abc'
p reduce([[1, 2], ['a', 'b']]) { |acc, value| acc + value } # => [1, 2, 'a', 'b']
p reduce([1, 2, 3, 4, 5]) { |acc, num| acc + num }                    # => 15
p reduce([1, 2, 3, 4, 5], 10) { |acc, num| acc + num }
