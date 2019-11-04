We wrote a neutralize method that removes negative words from sentences. However, it fails to remove all of them. What exactly happens?
```
def neutralize(sentence)
  words = sentence.split(' ')
  words.each do |word|
    words.delete(word) if negative?(word)
  end

  words.join(' ')
end

def negative?(word)
  [ 'dull',
    'boring',
    'annoying',
    'chaotic'
  ].include?(word)
end

puts neutralize('These dull boring cards are part of a chaotic board game.')
# Expected: These cards are part of a board game.
# Actual: These boring cards are part of a board game.
```
The error here is withing the iteration through the `words` array. 
`#each` is called by `words` and uses indexes to reference objects to pass to the block. when a word is deleted during iteration it moves the index of the rest of the collection. 
When `'dull'` is removed from the collection during iteration, the next element, `'boring'` gets skipped over by the method.