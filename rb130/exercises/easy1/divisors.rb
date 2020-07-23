# given positive int
# return array
# 
# from the given int, return all the divisors of that number
# 
# add given
# add 1 if 1 is not the number
# skip past halfway
# skip evens if num is odd
# skip 0s unless given ends in 0
# skip 5s unless given ends in 5 or 0
# 
# collect possible endings in an array
# find the differences
#   what it takes to get to the next possible ending
#     if at 1 and cant be even then next is 3, diference is 2
# from starting num
#   find if divisable
#     modulo = 0
#   add diference to next
# 
# get possible endings
#   endings array = [0..9]
#   delete 0 unless num ends in 0
#   del evens unless num is even
#   del 5 unless ends in 5
#   return array
# 
# find differences
#   itersate thur endings
#     distance from one to next
#     to first if last
# 
# next to add
#   move diff 1 to end
#   return [-1]
# 
# get divisors
#   diffs = find diffs
#   x = 1
#   divisors = []
#   loop
#     divisors << x if given % x == 0
#     x + next_to_add
#     break if num > given / 2

def divisors(num)
  return [1] if num == 1

  iteration_differences = find_differences(num)
  x = 1
  divisors = []
  square_root = Math.sqrt(num)

  loop do
    if (num % x == 0)
      divisors.concat([x, num / x])
    end
    x += next_to_add(iteration_differences)
    break if x > square_root
  end
  divisors.sort
end

def next_to_add(differences)
  differences << differences.shift
  differences[-1]
end

def find_differences(num)
  endings = possible_endings(num)
  endings.map.with_index do |ending, i|
    if i + 1 == endings.size
      endings[0] + 10 - ending
    else
      endings[i + 1] - ending
    end
  end
end

def possible_endings(num)
  last = num % 10
  endings = (0..9).to_a

  endings.delete(0) unless last == 0
  endings -= [2,4,6,8] unless num.even?
  endings.delete(5) unless [0, 5].include?(last)
  endings.delete(3) if [4, 7].include?(last)

  endings
end
