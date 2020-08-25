class BeerSong
  def lyrics
    verses(99, 0)
  end

  def verses(start, finish)
    sentences = []

    start.downto(finish) do |number|
      sentences << verse(number)
    end

    sentences.join("\n")
  end

  def verse(number)
    line1 = "#{number} bottles of beer on the wall, #{number} bottles of beer.\n"
    line2 = "Take one down and pass it around, #{number - 1} bottles of beer on the wall.\n"
    last_line = "Go to the store and buy some more, 99 bottles of beer on the wall."

    [line1, line2].each do |line|
      line.gsub!(/\b1 bottles/, '1 bottle')
      line.gsub!(/\b0/, 'no more')
      line.gsub!(/Take one(.*no more)/, 'Take it\1')
      line.gsub!(/.*-1.*/, last_line)
    end

    line1.capitalize + line2
  end
end

# get one or two int
# return string
#
# first line
# second line
# 0 line
#
# build a fill sentence method
#   get int
#   return string
#
#   build the custom beer song sentences based on the int
#
#   "num bottles of ...., num bottles of .... .\n"\
#   "take one down ...., new um bottles ..... ."
#
#   if num is 1, swap bottles to bottle
#   if 0 swap 0 for no more
#     if second sentence is 0 then custom sentence
#
# initilaize return string
# iterate from start to finish
#   finish is start if not given
#   pass number into build sentence method
#   add sentence to return stirng
