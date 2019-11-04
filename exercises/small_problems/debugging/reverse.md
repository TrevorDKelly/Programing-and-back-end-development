The reverse_sentence method should return a new string with the words of its argument in reverse order, without using any of Ruby's built-in reverse methods. However, the code below raises an error. Change it so that it behaves as expected.
```ruby
def reverse_sentence(sentence)
  words = sentence.split(' ')
  reversed_words = []

  i = 0
  while i < words.length
    reversed_words = words[i] + reversed_words
    i += 1
  end

  reversed_words.join(' ')
end

p reverse_sentence('how are you doing')
# expected output: 'doing you are how'
```
The error here is on line 7. 
The local variable `reversed_words` is initialized on line 3 and assigned an empty array object. 
On line 7 `words[i]` returns a string object and trys to add the array object `reversed_words` to it. 
This can be fixed by changing line 7 to `reversed_words.prepend(words[i])`.
the `#prepend` method will add the argument to the start of the calling array.