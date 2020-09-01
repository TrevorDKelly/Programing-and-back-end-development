# convert ints to bianary string
#   pass to method
#
# invalid input is '0'
#
# 1 - wink
# 10 - double blink
# 100 - close eyes
# 1000 - jump
# 10000 - do in reverse
#
# invalid
#   more than 10000 valid?
#
# convert to bianary
#   get string or int
#   return string of 1s and 0s
#
#   if given a string
#     check if valid bianary
#     return '0' if not
#     return as string
#   if int
#     convert to bianary
#       to_s 2
#     return as string
# commands
#   have bianry string
#   return array
#
#   array with all commands in order
#   delete if index of string is 0
#   reverse if theres 5

class SecretHandshake
  COMMANDS = ['wink', 'double blink', 'close your eyes', 'jump']

  def initialize(given)
    @bianary = convert_to_bianary(given)
  end

  def commands
    code = @bianary.chars.reverse

    directions = COMMANDS.select.with_index do |_, index|
      code[index] == '1'
    end

    code[4] == '1' ? directions.reverse : directions
  end

  private

  def convert_to_bianary(given)
    if given.class == String
      given.match(/[^10]/) ? '0' : given
    elsif given.class == Integer
      given.to_s(2)
    else
      '0'
    end
  end
end
