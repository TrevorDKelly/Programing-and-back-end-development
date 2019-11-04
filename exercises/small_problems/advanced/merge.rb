# get two eorted arrays
# retrun one sorted array
#
# initialize result array
# initialize first, second = 0, 0
# loop till both are nil
#   get first number from both
#     arr1[first]
#     arr2[second]
#   find which is lower
#     check for nil
#       if one is nil add whoe other to end
#     add lower to new
#       add to result
#       change that array's number
# return result

def merge(arr1, arr2)
  result = []
  index1 = 0
  index2 = 0

  until arr1[index1].nil? || arr2[index2].nil?
    if arr1[index1] < arr2[index2]
      result << arr1[index1]
      index1 += 1
    else
      result << arr2[index2]
      index2 += 1
    end
  end
  result.concat(arr1[index1..-1], arr2[index2..-1])
end

# arr2_i = 0
# itterate through arr1
#   loop
#     break if arr2[i] > arr1 item
#     add arr2[i] to result
#     i + 1
#   add arr1 item to result

def merge(arr1, arr2)
  arr2_i = 0
  result = []

  arr1.each do |arr1_item|
    while arr2_i < arr2.size && arr2[arr2_i] < arr1_item
      result << arr2[arr2_i]
      arr2_i += 1
    end
    result << arr1_item
  end

  result.concat arr2[arr2_i..-1]
end

# MERGE SORT
# split array in half until it has one item
#   if more than one in array
#     find half
#     return two arrays
#       put arrays through method
#   else return array of 1 object
# merge each nested array
#   enter two arrays into
#
# find middle
#   array size / 2
# return array middle is 0
# merge(method(first half), method(second half))

def merge_sort(arr)
  mid = arr.size / 2

  mid.zero? ? arr : merge(merge_sort(arr[0...mid]), merge_sort(arr[mid..-1]))
end

# split into arrays of 1
#   map with block of [obj]
# until array size is 1
#   merge sort first two objects

def merge_sort(arr)
  merge_arr = arr.map { |obj| [obj] }
  merge_arr[0] = merge(merge_arr.shift, merge_arr[0]) until merge_arr.size == 1
  merge_arr[0]
end

p merge_sort([9, 5, 7, 1]) == [1, 5, 7, 9]
p merge_sort([5, 3]) == [3, 5]
p merge_sort([6, 2, 7, 1, 4]) == [1, 2, 4, 6, 7]
p merge_sort(%w(Sue Pete Alice Tyler Rachel Kim Bonnie)) == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
p merge_sort([7, 3, 9, 15, 23, 1, 6, 51, 22, 37, 54, 43, 5, 25, 35, 18, 46]) == [1, 3, 5, 6, 7, 9, 15, 18, 22, 23, 25, 35, 37, 43, 46, 51, 54]
