def zip(arr1, arr2)
  new_arr = []
  arr1.size.times do |i|
    new_arr << [arr1[i], arr2[i]]
  end
  new_arr
end
