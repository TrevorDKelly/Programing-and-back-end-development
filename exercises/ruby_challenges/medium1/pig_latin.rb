class PigLatin
  LOCKED_START = /^(a|e|i|o|u|xr|yt)/
  GROUPED_STARTS = /^(ch|thr|th|qu|sch|.qu|.)/

  def self.translate(input)
    input.split.map { |word| convert(word) }.join(' ')
  end

  def self.convert(word)
    if word =~ LOCKED_START
      word + 'ay'
    else
      word.sub(/#{GROUPED_STARTS}(.*)\z/, '\2\1ay')
    end
  end
end

# more than one word
#   split to words, run for each word, retrun as space separated stirng
# one word
#   normal
#     grab first letter
#     put at end
#     add 'ay'
#
#   edge cases
#     only add 'ay'
#       vowel, xr, yt,
#     move more letters
#       ch, th, qu, thr, sch,
#       const then qu
#     regex with ^ then all edge cases
#
#   save first chunk
#   save second chunk
#   return first + second + 'ay'

