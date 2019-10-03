# get string
# return boolean
# 
# initialize used_blocks
# initialize boolean as true
# separate string into chars
# iterate through the chars
#   check if character is in used_blocks
#     boolean = false
#   else
#     add to used_blocks with match
#     
# return boolean
# 
# initialize blocks as nested array



BLOCKS = {
  B: 'O', X: 'K', D: 'Q', C: 'P', N: 'A',
  G: 'T', R: 'E', F: 'S', J: 'W', H: 'U',
  V: 'I', L: 'Y', Z: 'M'
}

def block_word?(str)
  used_blocks = []

  str.chars.each do |letter|
    return false if used_blocks.include?(letter.upcase)
    used_blocks << letter.upcase
    used_blocks << if BLOCKS.keys.include?(letter.upcase.to_sym)
                     BLOCKS[letter.upcase.to_sym]
                   else
                     BLOCKS.key(letter.upcase).to_s
                   end
  end
  true
end

BLOCK = %w(BO XK DQ CP NA GT RE FS JW HU VI LY ZM)

def block_word?(str)
  BLOCK.none? { |blk| str.upcase.count(blk) > 1 }
end

p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true
p block_word?('butch') == false