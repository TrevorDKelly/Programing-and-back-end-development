# Searching

# get 6 numbers from user
# first 5 are collection
# 6th is to check for
# 
# initalize array
# loop
#   ask for numbers
#     5 times
#       promt user
#         give (nth) number
#   save to array
#     array << input
#     
# ask for last number
#   promt 
#     what number do you weant to check for?
#   last = answer
#   
# check array for last
#   array include? last
#   return true or false

NUMBERS = %w(1st 2nd 3rd 4th 5th)

def verify_number(num)
  num == num.to_i.to_s
end

def get_user_array
  array = []
  5.times do |i|
    num = nil
    loop do
      puts "Enter the #{NUMBERS[i]} number :"
      num = gets.chomp
      break if verify_number(num)
      puts "**Please only enter integers!**"
    end
    array << num.to_i
  end
  array
end

def check_array(array)
  puts "What number do you want to check for?"
  num = nil
  loop do
    num = gets.chomp
    break if verify_number(num)
    puts "**Please only enter integers!**"
  end
  
  array.include?(num.to_i)
end

p check_array(get_user_array)