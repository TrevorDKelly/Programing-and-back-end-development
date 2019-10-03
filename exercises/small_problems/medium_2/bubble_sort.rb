# get array
# retrun mutated array
# 
# initialize change_made boolean true
# until change_made is false
#   change_made = false
#   iterate thru array with index
#   next if last index
#   if index > index + 1
#     swap
#     change_made = true

def bubble_sort!(arr)
  change_made = true
  iteration = 0
  until change_made == false
    change_made = false
    iteration += 1
    arr.each_with_index do |_, index|
      next if index >= arr.size - iteration
      if arr[index] > arr[index + 1]
        arr[index], arr[index + 1] = arr[index + 1], arr[index]
        change_made = true
      end
    end
  end
  arr
end

array = [5, 3]
bubble_sort!(array)
p array == [3, 5]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
p array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)