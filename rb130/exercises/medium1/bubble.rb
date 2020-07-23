# get array
# return array
# 
# swaped = false
# loop
# 
#   iterate 0 to size -2 (i)
#     take i and i+1
#     compare
#       if i >
#         swap!
#         swapped = true
#   break unless wswapped
# 
# return arr

def bubble_sort!(arr)
  loop do
    swapped = false
    (0..(arr.size - 2)).each do |i|
      good = block_given? ? yield(arr[i], arr[i + 1]) : arr[i] <= arr[i + 1]
      unless good
        arr[i], arr[i + 1] = arr[i + 1], arr[i]
        swapped = true
      end
    end
    break unless swapped
  end
  arr
end

def bubble_sort_one!(arr)
  loop do
    swapped = false
    first = block_given? ? yield(arr[0]) : arr[0]
    (1..(arr.size - 1)).each do |i|
      second = block_given? ? yield(arr[i]) : arr[i]
      unless first <= second
        arr[i], arr[i - 1] = arr[i - 1], arr[i]
        swapped = true
      else
        first = second
      end
    end
    break unless swapped
  end
  arr
end

array = %w(sue Pete alice Tyler rachel Kim bonnie)
bubble_sort_one!(array) { |value| value.downcase }
p %w(alice bonnie Kim Pete rachel sue Tyler)
p array 
