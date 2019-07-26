# New Pet

  pets = ['cat', 'dog', 'fish', 'lizard']
  
  my_pet = pets[2]
  
  puts "I have a #{my_pet}"
  
# More than One

  my_pets = pets[2, 3]
  
  puts "I have a pet #{my_pets[0]} and a #{my_pets[1]}"
  
# Free the Lizard

  my_pets.pop
  
  puts "I have a pet #{my_pets[0]}"
  
# One Isn't Enough

  my_pets << pets[1]
  
  puts "I have a #{my_pets[0]} and a #{my_pets[1]}"
  
# What Color Are You?

  colors = ['red', 'yellow', 'purple', 'green']
  
  colors.each{ |color| puts "I am the color #{color}" }
  
# Doubled
  
  numbers = [1, 2, 3, 4, 5]
  
  doubled_numbers = numbers.map{ |number| number * 2 }
  
  p doubled_numbers
  
# Divisible By 3

  numbers = [5, 9 ,21, 26, 36]
  
  divisible_by_three = numbers.select{ |number| number % 3 == 0 }
  
  p divisible_by_three
  
# My Favorite Number Part 1

  favorites = [['Dave', 7], ['Miranda', 3], ['Jason', 11]]
  
# My Favorite Number Part 2

  flat_favorites = favorites.flatten
  
  p flat_favorites
  
# Are We The Same?

  array1 = [1, 5, 9]
  array2 = [1, 9, 5]
  
  p array1 == array2
  