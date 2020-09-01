# def smaller(arr)
#   arr.map.with_index { |outer, i| arr[(i + 1)..-1].count { |inner| inner > outer } }
# endget array
# return array
#
# map
#
# for each item in a given array, the return arry should have the count of how many objects to the right are smaller than it
#
# map
#   count from index +1 to end of array
#     if array[index] is > element
#
# arr map with index
#   index to end of array count
#     inner element > outer element

# hash
#   number > number smaller
#     adjust number smaller each time one comes up
#       adjust for all that it is smaller than
#   number > appearences
#     -1 when it comes up
#     add values for all smaller

# iterate thru array
#   count of smaller to the right
#     save count in hash
#     change all larger number counts in hash
#
# initialize hash
# map array
#   if number is in hash
#     get count
#   if not in hash
#     count smaller to the right
#   -1 for all hash numbers larger
#   return count

def smaller(array)
  counts = {}
  array.map.with_index do |number, i|
    update_larger(counts, number)
    counts[number] || counts[number] = array[(i + 1)..-1].count { |x| x < number }
  end
end

def update_larger(counts, number)
  counts.each do |value, count|
    if value > number
      counts[value] -= 1 if counts[value] > 0
    end
  end
end

p smaller([5,4,3,2,1])
