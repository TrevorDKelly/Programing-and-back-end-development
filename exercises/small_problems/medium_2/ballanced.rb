#get string
#return boolean
#
#initialize tracker
#iterate through characters
#  if ( tracker + 1
#  if ) tracker - 1
#  retrun false if tracker is negative
#tracker == 0

def balanced?(str)
  match_chars = [['(', ')'], ['[', ']'], ['{', '}']]
  match_chars.each do |pair|
    tracker = 0
    str.chars.each do |char|
      tracker += 1 if char == pair[0]
      tracker -= 1 if char == pair[1]
      return false if tracker.negative?
    end
    return false if !tracker.zero?
  end
  str.count("'").even? && str.count('"').even?
end

p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false
p balanced?('[[What]] {is this})?') == false
p balanced?('[{Hey!}]') == true
p balanced?('}Hey!{') == false
p balanced?('What {(is)] up') == false
p balanced?('"Hey!"') == true
p balanced?("'Hey!") == false
p balanced?("What \"is' up") == false