# get arr
# return element
# 
# get the size of each
# return the item with be largest size
# 
# largest = first
# max = yield first
# 
# iterate 1..-1
#   score = yield(element) 
#   if score > max
#     new largest
#     new max
# return largest

def max_by(arr)
  return nil if arr.empty?
  largest = arr.first
  max = yield(arr.first)

  arr[1..-1].each do |element|
    score = yield(element)
    if score > max
      max = score
      largest = element
    end
  end
  largest
end

