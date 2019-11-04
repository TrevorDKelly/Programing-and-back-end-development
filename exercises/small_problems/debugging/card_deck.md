We started working on a card game but got stuck. Check out why the code below raises a TypeError.

Once you get the program to run and produce a sum, you might notice that the sum is off: It's lower than it should be. Why is that?
```ruby
cards = [2, 3, 4, 5, 6, 7, 8, 9, 10, :jack, :queen, :king, :ace]

deck = { :hearts   => cards,
         :diamonds => cards,
         :clubs    => cards,
         :spades   => cards }

def score(card)
  case card
  when :ace   then 11
  when :king  then 10
  when :queen then 10
  when :jack  then 10
  else card
  end
end

# Pick one random card per suit

player_cards = []
deck.keys.each do |suit|
  cards = deck[suit]
  cards.shuffle!
  player_cards << cards.pop
end

# Determine the score of the remaining cards in the deck

sum = deck.reduce(0) do |sum, (_, remaining_cards)|
  remaining_cards.map do |card|
    score(card)
  end

  sum += remaining_cards.sum
end

puts sum
```

the type error comes from line 34 and the `#sum` method. as written, `#sum` is called on the paramiter `remaining_cards` which points to a collection containing a mix of integers and symbols. these objects cannot be added together so a type error is raised. 
however the reason for this error comes from line 30 where `#map` is called on the paramiter `remaining_cards`.
`#map` returns a new array however the array is not captured.
withing the block passed as an argument to `#map`, each element in the calling collection is passed to the `score` method.
this returns an integer and the `#map` method retuns an array of integers returned by the block. this array is what should invoke the `#sum` method on line 34.
the block passed to reduce on line 29 to 35 shoud look like this:
```ruby
sum = deck.reduce(0) do |sum, (_, remaining_cards)|
  remaining_cards = remaining_cards.map do |card|
    score(card)
  end

  sum += remaining_cards.sum
end
```

The second error is due to the values assigned to the keys in the `deck` hash on lines 3 to 6. All of the values are the same array object referenced by the local variable `cards`
On line 24, within the `#each` block, `cards` calls the `#pop` method. This mutates the array object referenced by all of the values when it is meant to just mutate one of the values. 
to fix this, all of the keys in `deck` have to be unique. this can be done bay assigning each value to `cards.clone`
