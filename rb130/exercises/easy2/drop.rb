# given an array and a block, find the first element for which the block returns false. return and array which has the false element and all the following elements.
# get array block
# return array
# 
# empty array returns empty array
# all true returns empty array
# 
# iterate thru array
#   return the index if yield is falsey
# return [i..-1]

def drop_while(arr)
  i = 0
  loop do
    return [] if i >= arr.size
    break unless yield arr[i]
    i += 1
  end
  arr[i..-1]
end

