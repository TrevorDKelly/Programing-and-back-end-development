class Minilang
  OPERATIONS = %w(PUSH ADD SUB MULT DIV MOD POP PRINT)
  
  class MinilangError < StandardError; end
  
  class InvalidToken < MinilangError; end
  
  class EmptyStack < MinilangError; end
  
  attr_reader :stack
  attr_accessor :arguments, :register
  
  def initialize(command_string)
    @stack = []
    @arguments = command_string
    @register = 0
  end
  
  def eval(*known)
    updated_arguments = (format(self.arguments, *known)).split
    updated_arguments.each { |arg| evaluate_argument(arg) }
    rescue MinilangError => error
      puts error.message
  end
  
  def evaluate_argument(arg)
    if arg.to_i.to_s == arg
      self.register = arg.to_i
    elsif OPERATIONS.include?(arg)
      send(arg.downcase) 
    else
      raise InvalidToken, "Invalid Token: #{arg}"
    end
  end
  
  def next_in_stack
    raise EmptyStack, 'Empty Stack!' if stack.empty?
    stack.shift
  end
  
  def push
    stack.unshift(register)
  end
  
  def print
    puts register
  end
  
  def add
    self.register += next_in_stack
  end
  
  def sub
    self.register -= next_in_stack
  end
  
  def mult
    self.register *= next_in_stack
  end
  
  def mod
    self.register %= next_in_stack
  end
  
  def div
    self.register /= next_in_stack
  end
  
  def pop
    self.register = next_in_stack
  end
end

CENTIGRADE_TO_FAHRENHEIT =
  '5 PUSH %<degrees_c>d PUSH 9 MULT DIV PUSH 32 ADD PRINT'
c_to_f = Minilang.new(CENTIGRADE_TO_FAHRENHEIT)
c_to_f.eval(degrees_c: 100)
# 212
c_to_f.eval(degrees_c: 0)
# 32
c_to_f.eval(degrees_c: -40)
# -40

FAHRENHEIT_TO_CENTIGRADE = 
  '9 PUSH 5 PUSH 32 PUSH %<degrees_f>d SUB MULT DIV PRINT'
f_to_c = Minilang.new(FAHRENHEIT_TO_CENTIGRADE)
f_to_c.eval(degrees_f: 212)
# 212
f_to_c.eval(degrees_f: 32)
# 32
f_to_c.eval(degrees_f: -40)

MILES_TO_KM = '5 PUSH 3 PUSH %<miles>d DIV MULT PRINT'

mi_to_km = Minilang.new(MILES_TO_KM)

mi_to_km.eval(miles: 3)
mi_to_km.eval(miles: 50)
mi_to_km.eval(miles: 65)

KM_TO_MILES = '3 PUSH 5 PUSH %<km>d DIV MULT PRINT'
km_to_mi = Minilang.new(KM_TO_MILES)

km_to_mi.eval(km: 5)
km_to_mi.eval(km: 80)
km_to_mi.eval(km: 105)

AREA = '%<length>d PUSH %<width>d MULT PRINT'
area = Minilang.new(AREA)

area.eval(length: 10, width: 5)