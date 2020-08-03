class SumOfMultiples
  def initialize(*multipliers)
    @multipliers = multipliers.empty? ? [3, 5] : multipliers
  end

  def to(max_multiple)
    multiples = gather_all_unique_multiples(max_multiple)
    
    multiples.inject(0, :+)
  end

  def self.to(max_multiple)
    SumOfMultiples.new.to(max_multiple)
  end

  private 

  def gather_all_unique_multiples(max_multiple)
    multiples = []

    @multipliers.each do |multiplier|
      product = 0

      loop do
        product += multiplier 
        break if product >= max_multiple

        multiples << product
      end
    end

    multiples.uniq
  end
end

p SumOfMultiples.to(20)
# get int
# have multipliers
# return int
# 
# gather all the multiples of the multipliers up to but not including given
# remove duplicates
# add all together
# return int
# 
# iterate thru multipliers
#   product = 0
#   i = 1
#   until product >= given
#     product = multiplier * i
