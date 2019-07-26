produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

def fruits(produce_list)
  produce_keys = produce_list.keys
  fruits = {}
  counter = 0

  loop do
    break if counter == produce_keys.length

    key = produce_keys[counter]
    value = produce_list[key]

    if value == 'Fruit'
      fruits[key] = value
    end

    counter += 1
  end

  fruits
end

p fruits(produce)


def double_numbers!(numbers)
  counter = 0
  
  loop do
    break if counter == numbers.length
    
    numbers[counter] *= 2
    
    counter += 1
  end
end

numbers = [1, 2, 3, 4, 5]

def double_odd_index(numbers)
  doubled_numbers = []
  counter = 0
  
  loop do
    break if counter == numbers.size
    
    if counter.odd?
      doubled_numbers << numbers[counter] * 2
    end
    
    counter += 1
  end
  
  doubled_numbers
end

p numbers
p double_odd_index(numbers)
