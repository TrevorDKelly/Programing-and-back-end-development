# get size of array, what to take out
# return int

# create an array of the ints 1..n. remove the kth element.
# starting from the next number, remove the kth element. loop to the start
# after the last element in the collection.

# create array
# x = 0
# until 1 remaining
#   x += k % array size - 1
#   remove element x
# return last element

def josephus_survivor(n,k)
  arr = (1..n).to_a
  x = 0

  arr.delete_at(x = (x + k - 1) % arr.size) until arr.size == 1
  arr[0]
end

p josephus_survivor(7,3)