# get int
# output diamond
# 
# data structure
#   array
#     number of elements is input
# 
# initalize array
#   set size to input
# set each index of array to correct number of stars
#   initialize stars_count and assign 1
#   up to half
#     add stars_count number of stars as string to that index
#     add 2 to stars to stars_count
#   assign half + 1 till end to half - 1 till start
# output array
#   print each line centered to input width

def display_diamond(diamond_array)
  diamond_array.each { |line| puts line.center(diamond_array.size) }
end

def create_line(width)
  width -= 2
  width.negative? ? '*' : (' ' * width).center(width + 2, '*')
end

def diamond(lines)
  diamond_array = Array.new(lines)
  half = lines / 2
  
  star_count = 1
  0.upto(half) do |line|
    diamond_array[line] = create_line(star_count)
    star_count += 2
  end
  
  diamond_array[(half + 1)..-1] = diamond_array[0...half].reverse
  
  display_diamond(diamond_array)
end


