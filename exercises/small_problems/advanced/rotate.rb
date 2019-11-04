# get nested array
# return new nested array
# 
# first array becomes last elements in each new array
# number of arrays becomes size of new arays
# size of arrays becomes number of arrays
# 
# initialize return array
# outer size - 1 to 0
#   return array gets
#     inner size map 
#       input[outer][inner]

# iterate throug hinner array indexes going 0...
#   iterate though outer array backwards ..0
#     get outer number, inner number

def rotate90(matrix)
  return_arr = []
  
  (0...matrix.first.size).each do |inner_index|
    return_arr << (matrix.size - 1).downto(0).map do |outer_index|
      matrix[outer_index][inner_index]
    end
  end
  return_arr
end

def rotate(matrix, degrees = 90)
  rotations = case degrees
              when 90  then 1
              when 180 then 2
              when 270 then 3
              when 360 then 4
              else return "Unrecognized rotation degree"
              end

  rotations.times { matrix = rotate90(matrix) }
  
  matrix
end

matrix1 = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

matrix2 = [
  [3, 7, 4, 2],
  [5, 1, 0, 8]
]

new_matrix1 = rotate90(matrix1)
new_matrix2 = rotate90(matrix2)
new_matrix3 = rotate90(rotate90(rotate90(rotate90(matrix2))))

p new_matrix1 == [[3, 4, 1], [9, 7, 5], [6, 2, 8]]
p new_matrix2 == [[5, 3], [1, 7], [0, 4], [8, 2]]
p new_matrix3 == matrix2

p rotate(matrix1)
p rotate(matrix1, 180)
p rotate(matrix1, 270)
p rotate(matrix1, 360)
p rotate(matrix2)
p rotate(matrix2, 180)
p rotate(matrix2, 270)
p rotate(matrix2, 360)