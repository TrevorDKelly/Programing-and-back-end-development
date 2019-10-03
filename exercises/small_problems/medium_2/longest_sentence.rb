# get string
# return string
# 
# load in text file
# run through program
#   break up srting into sentences
#     split at . or ! or ?
#   itereate through sentences
#     break up into words
#       split at ' '
#     count words
#     save as longest if longest
#   print longest with word count
  
def longest_sentence(text)
  longest = ''
  text.scan(/[^.?!]+\.|\?|!/).each do |sentence|
    longest = sentence.strip if sentence.split.size > longest.split.size
  end
  
  puts "The Longest sentence (#{longest.split.size} words) is: \n#{longest}"
end

text_file = File.open('example_text.txt').read

longest_sentence(text_file)