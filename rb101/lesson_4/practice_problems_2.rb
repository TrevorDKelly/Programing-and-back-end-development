# 1
  flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
  
  flintstones.each_with_object({}) { |name, hash| 
    hash[name] = flintstones.index(name)
  }
  
# 2
  ages = { 
    "Herman" => 32, 
    "Lily" => 30, 
    "Grandpa" => 5843, 
    "Eddie" => 10, 
    "Marilyn" => 22, 
    "Spot" => 237 
  }
  
  total_years = 0
  
  ages.each { |_, age| total_years += age }
  
# 3
  ages.select { |_, age| age < 100 }
  
# 4
  youngest = 0
  
  ages.each do |_, age|
    if youngest == 0
      youngest = age
    elsif age < youngest
      youngest = age
    end
  end
  
# 5
  flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
  
  flintstones.index { |name| /^Be.*/.match(name) }
  
# 6
  flintstones.map! do |name|
    name[0, 3]
  end
  
# 7
  statement = "The Flintstones Rock"
  
  p statement.each_char.each_with_object({}) { |letter, hash|
    next if letter == ' '
    
    letter.upcase!
    
    if hash[letter] == nil
      hash[letter] = 1
    else
      hash[letter] += 1
    end
  }
  
# 8
  # the first code will output => 1 /n 3
  # the second would ouput =>1 /n 2

# 9
  def titleize(str)
    arr = str.split
    arr.each do |word|
      word.capitalize!
    end
    arr.join(' ')
  end
  
  # str.split.map { |word| word.capitalize }.join(' ')
  
# 10
  munsters = {
    "Herman" => { "age" => 32, "gender" => "male" },
    "Lily" => { "age" => 30, "gender" => "female" },
    "Grandpa" => { "age" => 402, "gender" => "male" },
    "Eddie" => { "age" => 10, "gender" => "male" },
    "Marilyn" => { "age" => 23, "gender" => "female"}
  }
  
  munsters.each do |_, value|
    case value['age']
    when 0..17
      value['age_group'] = 'kid'
    when 18..64
      value['age_group'] = 'adult'
    else
      value['age_group'] = 'senior'
    end
  end
  
  p munsters
  
  