# Reading Error Messages

  # The first error will be an arguments error. When the method is defined it 
  # only has one paramiter, numbers. the first time the method is called it is 
  # given several arguments
  
  # The second time the method is called the error would be a no method error.
  # the argument passed is a numberic and the method uses the #each method which 
  # is not available to numerics. 
  
  # to get this method to work it would need to be passed an array.
  
# Weather Forcast
  
  # The error here is the sunshine variable is not choosing between the booleans
  # of TRUE and FALSE, it is choosing between the stings 'true' and 'false'.
  # Since any value other than nil and FALSE equals true, the if statement in 
  # the method always is TRUE.
  
  def predict_weather
    sunshine = [true, false].sample
    
    if sunshine
      puts "It's so sunny out!"
    else
      puts "It's cloudy!"
    end
    
  end
  
# Multiply by 5

  # the output by putting in 10 right now would be 1010101010
  # all that needs to change is making line 6 read number = gets.chomp.to_i
  
# Pets

  pets = { cat: 'fluffy', dogs: ['sparky', 'fido'], fish: 'oscar' }
  
  pets[:dogs] << ('bowser')
  
  p pets
  
# Even Numbers

  # the code is curently using the map method which returns the result of the 
  # block for each item in an array. This will cupently output [false, true, false...]
  # instead of #map it should be #select
  
  numbers = [5, 2, 6, 9, 4, 5, 8]
  
  even_numbers = numbers.select { |number| number.even? }
  
  p even_numbers
  
# Confuscius Says

  # The problen being run into here is within the #get_quote method
  # because it was written with 3 separate if statements, all three run each time 
  # and the method's return is is the last line of code run.
  # the last line run here is the if person == "Einstein"
  # since it is not true the block is not run and a nil is returned.
  
  # to solve this it can be changed to have an if/else block or better, a case statement
  
  def get_quote(person)
    
    case person
      when 'Yoda'
        'Do. Or do not. There is no try.'
      when 'Confucius'
        'I hear and I forget. I see and I remember. I do and I understand.'
      when 'Einstein'
        'Do not worry about your difficulties in Mathematics. I can assure you mine are still greater.'
    end
  end
  
  puts 'Confucius says:'
  puts '"' + get_quote('Confucius') + '"'
    
    
# Account Ballance

  # The error here is that then the #each method is called on each month, it is 
  # resetting the ballance variable to just the total for that month.
  # to fix it change line 32 to balance += calculate_balance(month)
  
  
# Colorful Things

  # The error comes from the last iteration of the loop. there are 8 colors but
  # only 7 things. on the 8th loop the things[i] == nil and there will be a 
  # type error.
  # I thin kthe best fix would be to change the loop break to check both colors
  # and things so if the arrays are adjusted in the future it wont cause the same problem.

  # Also, it is curently checking for i greater than the length of the arrays. 
  # This should be changed to == because the last index of the array is always 
  # one less then the length since it starts at 0

  colors = ['red', 'yellow', 'purple', 'green', 'dark blue', 'turquoise', 'silver', 'black']
  things = ['pen', 'mouse pad', 'coffee mug', 'sofa', 'surf board', 'training mat', 'notebook']

  colors.shuffle!
  things.shuffle!

  i = 0
  loop do
    break if (i == colors.length) || (i == things.length)
  
    if i == 0
      puts 'I have a ' + colors[i] + ' ' + things[i] + '.'
    else
      puts 'And a ' + colors[i] + ' ' + things[i] + '.'
    end
  
    i += 1
  end
  
# Digit Product

  # The mistake here was in setting the product variable to 0
  # this means that every time the digits.each loop is run, it is multiplie by zero
  # the variable should be set to 1 so that the first number fed into the loop
  # multiplies by one to start.
  
# Warriors and Wizards

  # The error is a type error. the input on line 15 is a string but will need to
  # be changed to a symbol to match with the character_classes hash. 
  # line 15 should be input = gets.chomp.downcase.to_sym
  
  # Error is no inplicit change of nil to hash. 