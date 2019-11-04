A friend of yours wrote a number guessing game. The first version he shows you picks a random number between 1 and a provided maximum number and offers you a given number of attempts to guess it.

However, when you try it, you notice that it's not working as expected. Run the code and observe its behavior. Can you figure out what is wrong?
```ruby
def valid_integer?(string)
  string.to_i.to_s == string
end

def guess_number(max_number, max_attempts)
  winning_number = (1..max_number).to_a.sample
  attempts = 0

  loop do
    attempts += 1
    break if attempts > max_attempts

    input = nil
    until valid_integer?(input)
      print 'Make a guess: '
      input = gets.chomp
    end

    guess = input.to_i

    if guess == winning_number
      puts 'Yes! You win.'
    else
      puts 'Nope. Too small.' if guess < winning_number
      puts 'Nope. Too big.'   if guess > winning_number

      # Try again:
      guess_number(max_number, max_attempts)
    end
  end
end

guess_number(10, 3)
```
The error in this code is from when the `guess_number` method calls itself within the method definition. 
On lines 6 in the method definition local variable `winning_number` is initialized and assiged a random number between 1 and the paramiter `max_number`
On line 7 the local variable `attempts` is initialized and assigned the integer `0`.
Because this method uses recursion, `winning_numbers` and `attempts` are initialized and assigned within a new scope with each invocation of `guess_number` from line 28 in the method definition.
Recursion is not necessary for this method. to fix this, line 28 can be removed.

