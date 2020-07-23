Group 1
  ```ruby
  my_proc = proc { |thing| puts "This is a #{thing}" } \"
  puts my_proc
  puts my_proc.class
  my_proc.call
  my_proc.call('cat')
  ```
Procs do not have a `to_s`, the object is output with `puts`.
the block parameters of a proc have lenient arity rules.
  a called proc which was defined with one parameter by passed non when executed will not raise an error.
  the parameter will have `nil` as a value

Group 2
  ```ruby
  my_lambda = lambda { |thing| puts "This is a #{thing}." }
  my_second_lambda = -> (thing) { puts "This is a #{thing}." }
  puts my_lambda
  puts my_second_lambda
  puts my_lambda.class
  my_lambda.call('dog')
  my_lambda.call
  my_third_lambda = Lambda.new { |thing| puts "This is a #{thing}." }"
  ```
  lambdas are `proc` objects
  there is more than one way to instantiate a lambda
    x = lambda { |a| puts a }
    x = -> (a) { puts a }
  lambdas are not a class.
    Lambda.new raises an error
  the arity is tight
    block parameters must be given a value

Group 3
  ```ruby
  def block_method_1(animal)
    yield
  end

  block_method_1('seal') { |seal| puts "This is a #{seal}."}
  block_method_1('seal')      "
  ```
  blocks have lenient arity like `proc` objects
    a block does not need to have an argument passed for all its parameters
  yielding to a block when no block is given raises an error

Group 4
  ```ruby
  def block_method_2(animal)
    yield(animal)
  end

  block_method_2('turtle') { |turtle| puts "This is a #{turtle}."}
  block_method_2('turtle') do |turtle, seal|
    puts "This is a #{turtle} and a #{seal}."
  end
  block_method_2('turtle') { puts "This is a #{animal}."}     "
  ```
  Blocks passed to methods have lenient airty rules. 
  not all block parameters have to be passed arguments
    will be set to nil if no argument is passed

Lambdas are `proc` objects, not inherited from but actually procs.
they follow the arity rules of methods
