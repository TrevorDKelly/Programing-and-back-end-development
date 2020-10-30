class School
  def initialize
    @students = Hash.new { Array.new }
  end

  def to_h
    @students.sort.to_h
  end

  def add(name, grade)
    @students[grade] += [name]
    @students[grade].sort!
  end

  def grade(number)
    @students[number]
  end
end


# to_h
#   have hash
#   return sorted hash
#     students alphabetically
#     grades low to high
#
#   sort all the values
#   sort by grade
#
#   sort hash - mutate
#   iterate - each
#     sort value - mutate
#
# add
#   get name, grade
#   return n/a
#   mutate students hash
#
#   if grade is in hash
#     add student to value
#   else
#     create new pair
#       grade => [student]
