# get int
# return string
# 
# retrun a string that lists how many times each prime number smaller than x can fit into x
# 
# get all primes smaller than x
# iterat thru them
#   find how many time is goes in
#   add to the return string
#     format
# return string
# 
# get primes
#   skip 1
#   coll = [2]
#   from 3 by 2s
#     add t ocollection if 
#       <= x
#       is prime
#       
# is prime
#   from 2..num / 4
#   false if num % x == 0

def is_prime?(num)
  return true if num < 4
  return false if num == 4 || num == 6
  (2..(num/4)).each do |x|
    return false if num % x == 0
  end
  true
end

def collect_primes(num)
  (2..num).select { |x| is_prime?(x) }
end

def decomp(n)
  primes = collect_primes(n)
  string = ''

  primes.each do |p|
    t = n/p
    string += "#{p}"
    string += "^#{t}" unless t == 1
    string += " * " unless p == primes.last
  end

  string
end
puts $LOADED_FEATURES
