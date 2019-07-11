# Make a Calculator
require 'pry'
require 'yaml'

MESSAGES = YAML.load_file('calculator_messages.yml')

# methods & variables
def prompt(message)
  Kernel.puts('->> ' + MESSAGES[LANGUAGE][message])
end

def valid_name?(name)
  true
end

def valid_num?(num)
  num == num.to_i.to_s
end

def valid_operator?(operator)
  valid = ['+', '-', '/', '*']
  valid.include?(operator)
end

num1 = nil
num2 = nil
operator = nil
LANGUAGE = 'en'

loop do
  prompt('welcome')
  name = Kernel.gets().chomp()
  if name.downcase == 'english'
    LANGUAGE = 'en'
    next
  elsif name.downcase == 'espanol'
    LANGUAGE = 'es'
    next
  elsif valid_name?(name)
    name.capitalize!
    break
  else
    prompt(name_error)
  end
end

# Get the numbers and the operator
loop do
  # first number
  loop do
    prompt('first_num')
    num1 = Kernel.gets().chomp()
    if valid_num?(num1)
      num1 = num1.to_i
      break
    else
      prompt('num_error')
    end
  end

  # operator
  loop do
    prompt('operator')
    operator = Kernel.gets().chomp()
    if valid_operator?(operator)
      break
    else
      prompt('operator_error')
    end
  end

  # second number
  loop do
    prompt('second_num')
    num2 = Kernel.gets().chomp()
    if num2 == '0' && operator == '/'
      prompt('div_by_zero')
    elsif valid_num?(num2)
      num2 = num2.to_i
      break
    else
      prompt('num_error')
    end
  end

  # perform calculation
  result = if operator == '/'
             "#{num1} #{operator} #{num2} = " +
               num1.to_f().public_send(operator, num2.to_f()).to_s()
           else
             "#{num1} #{operator} #{num2} = " +
               num1.public_send(operator, num2).to_s()
           end
  
  Kernel.puts(result)
  prompt('repeat?')
  again = Kernel.gets().chomp().downcase()
  break unless again == 'y'
end
