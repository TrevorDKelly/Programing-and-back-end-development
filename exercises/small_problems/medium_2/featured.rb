# get int
# return int
#
# iterate through numbers from given to ...
#   check if divisible by 7
#   check if odd
#   check if all digits are unique
#
# make uniq figures method
#   int to string
#   string to chars
#   chars uniq == chars

# get next divisible by 7 number
#   if even add 7
# step through numbers by 14
#   if uniq_num
#     return num

def all_unique_nums?(int)
  int.to_s.chars.uniq == int.to_s.chars
end

def find_next_odd_divisable_by_7(int)
  (int + 1..nil).each do |num|
    return num if num % 7 == 0 && num.odd?
  end
end

def featured(int)
  start = find_next_odd_divisable_by_7(int)
  start.step(nil, 14) do |num|
    return num if all_unique_nums?(num)
    return 'No number fulfills the requirements' if num > 1_023_456_987
  end
end

p featured(12) == 21
p featured(20) == 21
p featured(21) == 35

p featured(997) == 1029
p featured(1029) == 1043
p featured(999_999) == 1_023_547
p featured(999_999_987) == 1_023_456_987

p featured(9_999_999_999)
