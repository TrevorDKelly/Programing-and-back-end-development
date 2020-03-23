# two players take turns placing pieces into a slot on the board. pieces stack
# on top of each other until a row is filled. if a play has a vertical,
# horizontal, or diagonal row of 4 pieces tehy win. a draw if the board is full.
#
# players
# board
# row
# piece
#
# place
# turn
# win

class Player

end

class Human < Player
  attr_reader :piece

  def initialize
    @piece = '@'
  end
end

class Computer < Player
  attr_reader :piece

  def initialize
    @piece = 'X'
  end
end

class Board
  attr_reader :rows

  def initialize
    @rows = Array.new(7) { Row.new }
  end

  def create_display_rows
    arr = rows[0].spots
    rows[1..-1].each do |row|
      arr = arr.zip(row.spots)
      arr.each(&:flatten!)
    end
    arr
  end

  def to_s
    string = "  1 2 3 4 5 6 7  \n"
    create_display_rows.each do |row|
      string << '| '
      row.each { |spot| string << (spot.nil? ? 'O ' : spot + ' ') }
      string << "|\n"
    end
    string
  end
end

class Row
  attr_reader :spots

  def initialize
    @spots = Array.new(6)
    @next = 0
  end

  def place(piece)
    @spots[@next] = piece
    @next += 1
  end
end

class Game
  attr_accessor :board, :human, :computer
  def initialize
    @board = Board.new
    @human = Human.new
    @computer = Computer.new
  end

  def play
    puts board
  end
end

Game.new.play