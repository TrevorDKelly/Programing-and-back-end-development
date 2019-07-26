# Question 1
  ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
  
  ages['Spot']
  ages.any? { |key, _| key == 'Spot' }
  ages.has_key?('Spot')
  ages.key?('Spot')
  ages.include?('Spot')
  
# Question 2
  munsters_description = "The Munsters are creepy in a good way."
  
  munsters_description.swapcase!
  munsters_description.capitalize!
  munsters_description.downcase!
  munsters_description.upcase!
  
# Question 3
  ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }
  additional_ages = { "Marilyn" => 22, "Spot" => 237 }
  
  ages.merge!(additional_ages)
  
# Question 4
  advice = "Few things in life are as important as house training your pet dinosaur."
  
  advice.match?('Dino')
  
# Question 5
  flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
  
# Question 6
  flintstones << 'Dino'

# Question 7
  flintstones.concat(%w(Dino Hoppy))

# Question 8
  advice.slice!(/Fe.*t\sas/)
  # The #slice method does not mutate so advice would have the same string
  advice.slice(0, advice.index('house'))
  
# Question 9
  statement = "The Flintstones Rock!"
  t_count = 0
  statement.each_char { |letter| t_count += 1 if letter.downcase == 't' }
  p t_count
  statement.count('t')
  
# Question 10
  title = "Flintstone Family Members"
  title.center(40)