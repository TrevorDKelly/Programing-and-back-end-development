class Sieve
  def initialize(cap)
    @cap = cap
  end

  def primes
    i = 0
    array = (2..@cap).to_a
    
    loop do
      break if i > array.size / 2
      
      current_num = array[i]
      
      array[(i + 1)..-1] = array[(i + 1)..-1].select do |x| 
        x % current_num != 0
      end

      i += 1
    end
    
    array
  end
end

# have cap
# return all primes
#   in an array
# 
# for every number from 2..given cap iterate thru and remove all its multiples from within the set
# iterate to half way
# 
# create array - to array
# i = 0
# arr = []
# loop
#   break if past end of array
#   current = arr[i] 
#   current + 1 to end = c to end select % != 0
#   i +=1
# return arr
