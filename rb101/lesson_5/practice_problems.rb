# 1
  arr = ['10', '11', '9', '7', '8']
  
  arr.sort { |a, b|
    b.to_i <=> a.to_i
  }
  
# 2
  books = [
    {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
    {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
    {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
    {title: 'Ulysses', author: 'James Joyce', published: '1922'}
  ]
 
 books.sort_by { |book|
  book[:published]
 }
 
# 3
  arr1 = ['a', 'b', ['c', ['d', 'e', 'f', 'g']]]
  arr1[2][1][3]

  arr2 = [{first: ['a', 'b', 'c'], second: ['d', 'e', 'f']}, {third: ['g', 'h', 'i']}]
  arr2[1][:third][0]
  
  arr3 = [['abc'], ['def'], {third: ['ghi']}]
  arr3[2][:third][0][0]
  
  hsh1 = {'a' => ['d', 'e'], 'b' => ['f', 'g'], 'c' => ['h', 'i']}
  hsh1['b'][1]
  
  hsh2 = {first: {'d' => 3}, second: {'e' => 2, 'f' => 1}, third: {'g' => 0}}
  hsh2[:third].keys[0]
  
# 4
  arr1 = [1, [2, 3], 4]
  
  arr2 = [{a: 1}, {b: 2, c: [7, 6, 5], d: 4}, 3]
  
  hsh1 = {first: [1, 2, [3]]}
  
  hsh2 = {['a'] => {a: ['1', :two, 3], b: 4}, 'b' => 5}
  
  arr1[1][1] = 4
  arr2[2] = 4
  hsh1[:first][2][0] = 4
  hsh2[['a']][:a][2] = 4
  
# 5
  munsters = {
    "Herman" => { "age" => 32, "gender" => "male" },
    "Lily" => { "age" => 30, "gender" => "female" },
    "Grandpa" => { "age" => 402, "gender" => "male" },
    "Eddie" => { "age" => 10, "gender" => "male" },
    "Marilyn" => { "age" => 23, "gender" => "female"}
  }
  
  male_ages = 0
  
  munsters.each_value do |name|
    if name['gender'] == 'male'
      male_ages += name['age']
    end
  end
  
# 6
  munsters.each do |name, info|
    puts "#{name} is a #{info['age']}-year-old #{info['gender']}."
  end
  
# 7
  a = 2
  b = [5, 8]
  arr = [a, b]
  
  arr[0] += 2
  arr[1][0] -= a
  
  # a = 2
  # b = [3, 8]
  # arr = [4, [3, 8]]
  
# 8
  hsh = {
    first: ['the', 'quick'],
    second: ['brown', 'fox'], 
    third: ['jumped'], 
    fourth: ['over', 'the', 'lazy', 'dog']
  }
  
  hsh.each do |_, words|
    words.each do |word|
      word.each_char do |letter|
        puts letter if %w(a e i o u).include?(letter)
      end
    end
  end
  
# 9
  arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]
  
  arr.map do |sub_arr|
    sub_arr.sort { |a, b| b <=> a }
  end
  
# 10
  [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}].map do |hsh|
    new_hash = {}
    hsh.each do |k, v|
      new_hash[k] = v + 1
    end
    new_hash
  end
  
# 11
  arr = [[2], [3, 5, 7], [9], [11, 13, 15]]
  
  arr.map do |sub_array|
    sub_array.select { |num| num % 3 == 0 }
  end
  
# 12
  arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]
  
  arr.each_with_object({}) do |arr, hsh|
    hsh[arr[0]] = arr[1]
  end
  
# 13
  arr = [[1, 6, 7], [1, 4, 9], [1, 8, 3]]
  
  arr.sort_by do |sub_array|
    sub_array.select do |num|
      num.odd?
    end
  end
  
# 14
  hsh = {
    'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
    'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
    'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
    'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
    'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
  }
  
  hsh.each_with_object([]) do |(produce, info), arr|
    if info[:type] == 'fruit'
      arr << info[:colors].map { |color| color.capitalize }
    else
      arr << info[:size].upcase
    end
  end
  
# 15
  arr = [
         {a: [1, 2, 3]},
         {b: [2, 4, 6], c: [3, 6], d: [4]},
         {e: [8], f: [6, 10]}
  ]
  
  arr.select do |hsh|
    hsh.all? do |_, val_arr|
      val_arr.all? do |num|
        num.even?
      end
    end
  end
  
# 16
  def random_chars(num)
    hex = ('0'..'9').to_a + ('a'..'f').to_a
    
    str = ''
    num.times do
      str << hex.sample
    end
    
    str
  end
  
  def uuid
    arr = []
    uuid_layout = [8, 4, 4, 4, 12]
    
    uuid_layout.each do |size|
      arr << random_chars(size)
    end
    
    arr.join('-')
  end
  
  p uuid