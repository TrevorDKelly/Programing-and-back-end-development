# inner array size is number of arrays
# number of inner arrays is size of each array
# outer size times o_i
#   inner size times i_i
#     result[i_i] += arr[o_i][] 

def transpose(arr)
  result = []
  (0...arr[0].size).each do |inner_index|
    result << (0...arr.size).map do |outer_index|
                arr[outer_index][inner_index]
              end
  end
  result
end




# get nested array
# return same nested array
# 
# iterate through 0..2 a
#   iterate trhough 0..2 b
#     arr[a][b], arr[b][a] = [b][a], [a][b]



def transpose!(matrix)
  (0..1).each do |outer|
    (1..2).each do |inner|
      matrix[outer][inner], matrix[inner][outer] = 
        matrix[inner][outer], matrix[outer][inner]
    end
  end
  matrix
end

p transpose([[1, 2, 3, 4]])# == [[1], [2], [3], [4]]
p transpose([[1], [2], [3], [4]]) == [[1, 2, 3, 4]]
p transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]) ==
  [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]
p transpose([[1]]) == [[1]]