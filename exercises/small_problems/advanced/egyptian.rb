# egyptian
# 
# get rational
# retrun array
# 
# find the demoninator collection that gets to that rational
# initialize collection array
# initialize denom = 0
# Initialize current_rational = 0/1
# until current_rational = input
#   denom = denom + 1
#   if curren_rational + Rational 1 / denom <= input
#     add denom to array
#     curent_rational += Rational 1/denom


def egyptian(input)
  collection = []
  denom = 0
  current_rational = Rational(0, 1)
  until current_rational == input
    denom += 1
    if current_rational + Rational(1, denom) <= input
      collection << denom
      current_rational += Rational(1, denom)
    end
  end
  collection
end

# unegyptian
# get array
# return rational
# 
# get the rational resulting in adding 1 / each in input array
# 
# initialize result rational = 0/1
# iterate through input
#   add rational 1/iteration to result
# return result

def unegyptian(arr)
  arr.map { |num| Rational(1, num) }.sum
end

p unegyptian(egyptian(Rational(1, 2)))  == Rational(1, 2)
p unegyptian(egyptian(Rational(3, 4))) == Rational(3, 4)
p unegyptian(egyptian(Rational(39, 20))) == Rational(39, 20)
p unegyptian(egyptian(Rational(127, 130))) == Rational(127, 130)
p unegyptian(egyptian(Rational(5, 7))) == Rational(5, 7)
p unegyptian(egyptian(Rational(1, 1))) == Rational(1, 1)
p unegyptian(egyptian(Rational(2, 1))) == Rational(2, 1)
p unegyptian(egyptian(Rational(3, 1))) == Rational(3, 1)
