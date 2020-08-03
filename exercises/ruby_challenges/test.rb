require 'pry'
# recursive
#   for each of the spots in the placement array
#     start at 0
#     if i is not taken check the diaganols
#       if the distance in index is the same as the distance in number
#         check for all previous
#     if all passes, move to the next row
#       if the next row is past the end add 1 to posible solutions
#     else move to next spot
#       if last spot then move back to previous row
# 
# start at row 1
# place at column 0
#   check for risk
#     column taken?
#     diaganol check
#       skip if first
#       from row 0 to current - 1
#         does diference in index match difference in column
#   if checks pass
#     if at row 8
#       add 1 to solutions count
#     else
#       recusive for next row
#   move to next column
#     break if past 8th column

class Board
  def initialize
    @rows = Array.new(8)
    @solutions = 0
  end
  
  def solve
    row = 0
    place_in_row(row)
    @solutions
  end

  def place_in_row(row)
    column = 0
    loop do
      if spot_is_safe?(row, column)
        if row == 7
          @solutions += 1
        else
          @rows[row] = column
          place_in_row(row + 1)
        end
      end
      @rows[row] = nil
      column += 1
      break if column > 7
    end
  end

  def spot_is_safe?(row, column)
    return false if @rows.include?(column)
    return true if row == 0

    filled_rows = @rows[0..(row - 1)]

    filled_rows.each_with_index do |taken_column, taken_row|
      column_difference = (column - taken_column).abs
      row_difference = (row - taken_row).abs

      return false if column_difference == row_difference
    end
    true
  end
end

puts $LOADED_FEATURES
