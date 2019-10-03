# find n
# n = n - 1 + n - 2
# if n < 3
#   1
# else 
#   n = fib
  
def fibonacci(index)
  index < 3 ? 1 : fibonacci(index - 1) + fibonacci(index - 2)
end

# find index
# initialize array to [1, 1]
# until array size == index
#   array << [-1] + [-2]
# return array -1

def fibonacci(index)
  first, last = [1, 1]
  3.upto(index) do
    first, last = [last, first + last]
  end
  last
end


def fibonacci_last(num)
  fibonacci(num).to_s[-1].to_i
end

p fibonacci_last(15)        # -> 0  (the 15th Fibonacci number is 610)
p fibonacci_last(20)        # -> 5 (the 20th Fibonacci number is 6765)
p fibonacci_last(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
p fibonacci_last(100_001)   # -> 1 (this is a 20899 digit number)
p fibonacci_last(1_000_007) # -> 3 (this is a 208989 digit number)
p fibonacci_last(123456789)


  