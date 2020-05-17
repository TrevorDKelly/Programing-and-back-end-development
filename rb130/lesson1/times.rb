def times(int)
  counter = 0

  while counter < int
    yield(counter)
    counter += 1
  end

  int
end

def each(arr)
  counter = 0

  while counter < arr.size
    yield(arr[counter])
    counter += 1
  end

  arr
end

def select(arr)
  counter = 0
  new_arr = []

  while counter < arr.size
    new_arr << arr[counter] if yield(arr[counter])
    counter += 1
  end

  new_arr
end

def reduce(arr, acc = nil)
  counter = acc ? 0 : 1
  acc = arr[0] unless acc

  while counter < arr.size
    acc = yield(acc, arr[counter])
    counter += 1
  end

  acc
end
array = [1, 2, 3, 4, 5]

p reduce(array) { |acc, num| acc + num }                    # => 15
p reduce(array, 10) { |acc, num| acc + num }                # => 25
p reduce(['a', 'b', 'c']) { |acc, value| acc += value }     # => 'abc'
p reduce([[1, 2], ['a', 'b']]) { |acc, value| acc + value }
