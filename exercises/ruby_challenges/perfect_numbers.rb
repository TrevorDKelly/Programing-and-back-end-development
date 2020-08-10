class PerfectNumber
  def self.classify(num)
    raise StandardError if num < 1

    sum = sum_of_divisors(num)

    case
    when sum > num the  'abundant'
    when sum < num then  'deficient'
    when sum == num then 'perfect'
    end
  end

  private

  def self.sum_of_divisors(num)
    sum = 0
    (1..(num/2)).each do |potential_divisor|
      sum += potential_divisor if num % potential_divisor == 0
    end
    sum
  end
end

# get int
# return string
#   d, p, a
#
# find all the divisors of num
# add all divisor up
# if > num
#   abundant
# if < deficient
# if == perfect
#
# collection
#
# from 1/2 to 1
#   if num % x == 0
#     add to collection
# return collection
#
#
