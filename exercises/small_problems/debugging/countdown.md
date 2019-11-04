1.
Our countdown to launch isn't behaving as expected. Why? Change the code so that our program successfully counts down from 10 to 1.
```ruby
def decrease(counter)
  counter -= 1
end

counter = 10

10.times do
  puts counter
  decrease(counter)
end

puts 'LAUNCH!'
```
The error in this code has to with the invocation of the `decrease` method. 
Within the method definition of `decrease` on line 2 the `counter` paramiter is reassigned using the `-=` operator. This assignes `counter` to a new object and returns that object.
When `decrease` is invoked within the block on line 9 and passed the local variable `counter` as an argument, it returns a new object and `counter` continues to point to the integer `10`. 
To make this code run correctly, line 9 can be changed to read `counter = decrease(counter)`
this reassigns `counter` to the return value of the `decrease` invocation.
This example show the concept of variables as pointers and how reassinment within a method points the paramiter to a new object.

2.
Our countdown to launch isn't behaving as expected. Why? Change the code so that our program successfully counts down from 10 to 1.
```ruby
def decrease(counter)
  counter -= 1
end

counter = 10

10.times do
  puts counter
  decrease(counter)
end

puts 'LAUNCH!'
```
The error in this code is in not capturing the return value of the invocation of `decrease` on line 9.
the method definition of `decrease` on lines 1 to 3 takes one paramiter, `counter`. on line 2 `counter` is reassigned using the `-=` method. This points the paramiter to a new object, and because it is the last evaluated line of the method, its return value is what the method returns.
the local variable `counter` is initialized on line 5 and assigned the integer `5`.
on line 9 the `decrease` method is invoked and passed the local variable `counter` as an argument. 
because the method definition uses reassignment, the local variable `counter` continues to point to `10`. the method invocation returns the integer `9` but does nothing with it. 
To solve this problem line 9 can be changed to read `counter = decrease(counter)`
This example highlights how reassignment within a method does not adjust the passed in argument