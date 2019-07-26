# Create a string

  string = String.new
  
  
# Quote confusion

  puts "It's now 12 o'clock"
  
# Ignoring case

  name = "Rodger"
  
  p name.casecmp?("rOdGeR")
  p name.casecmp?("DAVID")
  
# Dynameic String

  name = 'Elizebeth'
  
  puts "Hello #{name}"
  
# Combining Names

  first_name = "John"
  last_name = "Doe"
  
  full_name = first_name + ' ' + last_name
  
  puts full_name
  
# Tricky Formatting

  state = "tExAs"
  
  state.capitalize!
  
  puts state
  
# Goodbye, not Hello

  greeting = 'Hello!'
  
  greeting.sub!("Hello", "Goodbye")
  
  puts greeting
  
# Print the Alphabet
  
  alphabet = "abcdefghijklmnopqrstuvwxyz"
  
  alphabet.split('') { |letter| puts letter }
  # OR
  puts alphabet.split('')
  
# Pluralize

  words = 'car human elephant airplane'
  
  words.split{ |word| puts word + 's' }
  
# Are you there?

  colors = "blue pink yellow orange"
  
  p colors.include?('yellow')
  p colors.include?('purple')
  