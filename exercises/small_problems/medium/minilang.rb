# get string
# return int
#
# separate string into each input
#   save as opporation array
#   convert numbers to integers
# initialize register assin 0
# initalize stack
#   empty array
# run through all operations
#   check for number
#     make register and remove from list
#   else
#     run operation and remove fom list
#       case statement

def run_operation!(operation, register, stack)
  case operation
  when 'PUSH'  then stack << register
  when 'ADD'   then register += stack.pop
  when 'SUB'   then register -= stack.pop
  when 'MULT'  then register *= stack.pop
  when 'DIV'   then register /= stack.pop
  when 'MOD'   then register %= stack.pop
  when 'POP'   then register = stack.pop
  else              puts register
  end
  register
end

def error_check(operation, stack)
  valid_ops = %w(ADD SUB MULT DIV MOD POP PUSH PRINT)
  stack_ops = %w(ADD SUB MULT DIV MOD POP)

  if operation == 'DIV' && stack.last.zero?
    'Divide by Zero Error'
  elsif stack_ops.include?(operation)
    "Stack Error: #{operation}: Stack empty" if stack.empty?
  elsif !valid_ops.include?(operation)
    "Invalid Token: #{operation}"
  end
end

def minilang(input)
  register = 0
  stack = []

  input.split.each do |operation|
    if operation.to_i.to_s == operation
      register = operation.to_i
    else
      return puts error_check(operation, stack) if error_check(operation, stack)
      register = run_operation!(operation, register, stack)
    end
  end
end

minilang('3 PUSH 5 MOD PUSH 3 PUSH 7 PUSH 5 PUSH 4 MULT SUB ADD DIV PRINT')
