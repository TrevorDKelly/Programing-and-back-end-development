# count true blocks
# for each in collextion
#   count += 1 if yield 

def count(arr)
  count = 0
  arr.each { |element| count += 1 if yield(element) }
  count
end

