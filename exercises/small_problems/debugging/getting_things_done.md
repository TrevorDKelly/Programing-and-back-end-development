We wrote a method for moving a given number of elements from one array to another. We decide to test it on our todo list, but invoking move on line 11 results in a SystemStackError. What does this error mean and why does it happen?
```ruby
def move(n, from_array, to_array)
  to_array << from_array.shift
  move(n - 1, from_array, to_array)
end

# Example

todo = ['study', 'walk the dog', 'coffee with Tom']
done = ['apply sunscreen', 'go to the beach']

move(2, todo, done)

p todo # should be: ['coffee with Tom']
p done # should be: ['apply sunscreen', 'go to the beach', 'study', 'walk the dog']
```
The problem here is in the `move` method definition. The method is recursive but does not have a break point. 
the paramiter `n` is supposed to represent the stop point but when it gets to `0` there is nothing to stop it from going lower.
when, on line 2, the `#shift` method is invoked by `from_array` it will remove and return the first element in the array. if no element is there it will return nil. 
This method curently will run an endless loop that adds all the elements from `from_array` to `to_array` once `from_array` is empty it will add `nil` to `to_array` until the stack error is raised. 
This can be fixed by adding a break point if `n` equals `0`:
```ruby
def move(n, from_array, to_array)
  return if n == 0
  to_array << from_array.shift
  move(n - 1, from_array, to_array)
end
```
