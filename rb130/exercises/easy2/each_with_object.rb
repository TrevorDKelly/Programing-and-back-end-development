# get object and array
# return object
# 
# iterate thru array
#   yield object and element
# retunr object

def each_with_object(arr, obj)
  arr.each { |element| yield(element, obj) }
  obj
end

