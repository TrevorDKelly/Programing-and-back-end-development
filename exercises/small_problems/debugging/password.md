The following code prompts the user to set their own password if they haven't done so already, and then prompts them to login with that password. However, the program throws an error. What is the problem and how can you fix it?

Once you get the program to run without error, does it behave as expected? Verify that you are able to log in with your new password.
```ruby
password = nil

def set_password
  puts 'What would you like your password to be?'
  new_password = gets.chomp
  password = new_password
end

def verify_password
  puts '** Login **'
  print 'Password: '
  input = gets.chomp

  if input == password
    puts 'Welcome to the inside!'
  else
    puts 'Authentication failed.'
  end
end

if !password
  set_password
end

verify_password
```

There is an error with variable scope in this program. both the `set_password` and `verify_password` method definitions try to use the local variable `password` but niether has access to it because they do not take paramiters. 
in the `set_password` method definition, on line 6, a new method local `password` variable is initialized and assigned the object assinged to `new_password`
this `password` is not used and the outer scope local variable initialized on line 1 continues to point to `nil`
this can be fixed by changing line 22 to `password = set_password`
we can also remove line 6 and change line 5 to just `gets.chomp`.
The `verify_password` method definition will need to access the local variable `password` by accepting a paramiter. 
line 9 should read: `def verify_password(password)`
and line 25 shoud read: `verify_password(password)`