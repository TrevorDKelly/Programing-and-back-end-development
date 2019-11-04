String#upcase! is a destructive method, so why does this code print HEY you instead of HEY YOU? Modify the code so that it produces the expected output.
```ruby
def shout_out_to(name)
  name.chars.each { |c| c.upcase! }

  puts 'HEY ' + name
end

shout_out_to('you') # expected: 'HEY YOU'
```

When the `shout_out_to` method is invoked on line 7 it is passed `'you'` as an argument.
`shout_out_to` is defined from line 1 to 5 and takes one paramiter, `name`.
on line 2 `name` calls the `#chars` method which returns a new array object `['y', 'o', 'u']`. This array then calls the `#each` method which is passed a block. 
The block mutates the objects in the array with the `#upcase!` method but the string assigned to `name` is not touched. `name` still points to `'you`'
To fix this, line two can be changed to `name = name.chars.each { |c| c.upcase! }.join`
this example shows how when methods are chained, each succesive method is called on the object returned by the previous method.