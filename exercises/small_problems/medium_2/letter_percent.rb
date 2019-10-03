# get string
# return hash
# 
# initialize return hash
#   lowercase, uppercase, other = 0, 0, 0
# split string to characters,
# itterate through charaters
#   add 1 to lowercase if lowercase
#   add 1 to uppercase if uppercase
#   add 1 to other if other
# itterate thru hash values
#   num to float / string size * 100

def count_chars(str, hash)
  str.chars.each do |char|
    case char
    when /[a-z]/ then hash[:lowercase] += 1
    when /[A-Z]/ then hash[:uppercase] += 1
    else              hash[:neither] += 1
    end
  end
  hash
end

def letter_percentages(str)
  percents = { lowercase: 0, uppercase: 0, neither: 0 }
  count_chars(str, percents)
  
  percents.each do |type, value| 
    percents[type] = (value.to_f / str.size * 100).round(2)
  end
end


def letter_percentages(str)
  { lowercase: (str.count('a-z')     / str.size.to_f * 100).round(2),
    uppercase: (str.count('A-Z')     / str.size.to_f * 100).round(2),
    neither:   (str.count('^a-zA-Z') / str.size.to_f * 100).round(2)
  }
end

p letter_percentages('abCdef 123')
p letter_percentages('AbCd +Ef')
p letter_percentages('abcdefGHI')