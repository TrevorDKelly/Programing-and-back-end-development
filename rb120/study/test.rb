# get string
# return int

# given a string of numbers and operators, use order of operations to find the
# outcome of the equation

# split into numbers and symbols. find the multi and div, replace operator and
# numbers on either side with the solution and continue. then go thru and do the
# same for add and subtract.

# split
# get index of * or /
# replace i -1 , i , and i + 1 with solution
#   i-1 send (i, i+1)
# until size is 1
#   0.send (1, 2)

class Calculator
  def evaluate(string)
    line = string.split

    multiply_and_divide(line)

    add_and_subtract(line)

    line[0].to_f
  end

  private

  def multiply_and_divide(line)
    while line.include?('*') || line.include?('/')
      i = line.index { |x| ['*', '/'].include?(x) }

      num1 = line[i - 1].to_f
      operator = line[i]
      num2 = line[i + 1].to_f

      line[(i - 1)..(i + 1)] = num1.send(operator, num2)
    end
  end

  def add_and_subtract(line)
    line[0..2] = line[0].to_i.send(line[1], line[2].to_i) until line.size == 1
  end
end

p Calculator.new.evaluate("127")
