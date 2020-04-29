# get string
# return string

# given a string containg only R, G, and B, for each set of consecutive letters
# add to a new sting either the letter if they are both the same or the missing
# letter if they are different.

# spit sting to chars
# loop till one let
#   iterate with index thru chars
#     compare char with char of next index
#       return eiter letter if they are the same or missing if different
#       break if last char
# return last letter

def compare_letters(a, b)
  return a if a == b

  p ['R', 'G', 'B'].each { |l| return l unless [a, b].include?(l) }
end

def triangle(row)
  letters = row.chars

  until letters.size == 1
    letters.map!.with_index do |letter, i|
      if letters[i + 1] == nil
        ''
      else
        compare_letters(letter, letters[i + 1])
      end
    end

    letters.delete('')
  end

  letters[0]
end

p triangle('RBRGBRBGGRRRBGBBBGG') == 'G'