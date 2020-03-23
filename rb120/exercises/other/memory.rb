# pairs of matching symbols are placed on a board and covered. the user uncovers
# two at a time. if they are a match, they stay uncovered. if they are different
# they get covered up again. the game ends when all the pairs are discovered.

# symbol
#   match
# board
#   cover
#   uncover
# game

class BadSquareError < StandardError; end

class Square
  COVERED_SQUARE = '-'

  @@symbols = (('A'..'Z').to_a * 2).sort

  attr_accessor :covered, :face
  alias :covered? :covered

  def initialize
    @face = @@symbols.shift
    @covered = true
  end

  def match?(other)
    face == other.face
  end

  def uncover
    self.covered = false
  end

  def cover
    self.covered = true
  end

  def to_s
    covered ? COVERED_SQUARE : face
  end
end

class Board
  attr_reader :squares, :height, :width

  def initialize(dificulty)
    @squares = create_squares(dificulty)
    set_width
    set_height
  end

  def create_squares(dificulty)
    count = case dificulty
            when 1 then 16
            when 2 then 20
            when 3 then 24
            when 4 then 30
            when 5 then 36
            when 6 then 42
            when 7 then 48
            end
    arr = Array.new(count) { Square.new }

    arr.shuffle
  end

  def set_width
    @width = squares.size < 24 ? 4 : 6
  end

  def set_height
    @height = squares.size / width
  end

  def to_s
    system('cls') || system('clear')
    string = (1..width).each_with_object('   ') { |num, str| str << "#{num} " }
    square_num = 0
    height.times do |row|
      string += "\n#{row + 1 + width} "
      string += ' ' if (row + 1 + width) < 10
      width.times do
        string += "#{squares[square_num]} "
        square_num += 1
      end
    end
    string
  end

  def get_index_from_coordinates(coordinates)
    column, row = coordinates.minmax.map(&:to_i)
    row = row - width - 1

    (row * width) + column - 1
  end

  def get_square_at(coordinates)
    unless coordinates.all? { |c| c == c.to_i.to_s } && coordinates.size == 2
      raise BadSquareError, 'You must enter two numbers separated by a space'
    end

    index = get_index_from_coordinates(coordinates)

    raise BadSquareError, 'That is not a valid square' if squares[index].nil?

    squares[index]
  end

  def all_matches_found?
    !squares.any?(&:covered?)
  end
end

class Game
  attr_accessor :board

  def clear_screen
    system('cls') || system('clear')
  end

  def user_picks_square
    puts "Enter a row and column number separated by a space"
    square = nil
    loop do
      begin
        square = board.get_square_at(gets.chomp.split)
      rescue BadSquareError => e
        puts e.message
        next
      end
      break if square.covered?
      puts "That square is aleady flipped"
    end

    square.uncover
    square
  end

  def user_picks_two_squares
    squares = []
    2.times do
      squares << user_picks_square
      puts board
    end
    squares
  end

  def recover_squares(squares)
    squares.each(&:cover)
  end

  def squares_match?(squares)
    if squares.first.match?(squares.last)
      puts "You found a match!"
      true
    else
      puts "Those dont match"
      false
    end
  end

  def play(dificulty)
    time_start = Time.now
    turns = 0
    self.board = Board.new(dificulty)

    loop do

      puts board
      choices = user_picks_two_squares
      turns += 1

      recover_squares(choices) unless squares_match?(choices)

      break if board.all_matches_found?

      puts "Hit enter to flip more squares"
      gets
    end

    puts "You found all the matches!"
    time_end = Time.now
    puts "It took you #{turns} turns and #{time_end - time_start}!"
  end
end

Game.new.play(1)
