arr = ["9", "8", "7", "10", "11"]
p(arr.sort do |a, b|
  p arr
  b.to_i <=> a.to_i
end)
