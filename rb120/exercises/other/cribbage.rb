class Player
  VALID_PIECES = ('A'..'N').to_a + ('P'..'Z').to_a
  attr_reader :piece
  attr_accessor :score, :previous

  def initialize
    @piece = choose_piece
    @score = 0
    @previous = 0
  end

  def choose_piece
    puts "Enter a letter other than 'O' to use as your piece"
    answer = nil
    loop do
      answer = gets.chomp.upcase
      break if VALID_PIECES.include?(answer)
      puts "Your piece must be 1 letter that is not 'O'"
    end
    answer
  end
end

class Board
  def initialize
    @player1 = Player.new
    @player2= Player.new
  end

  def replace_negatives(spread)
    two = spread.index(-2)
    one = spread.index(-1)
    zero = spread.index(0)

    spread[two] = '  ' if two
    spread[one] = '  ' if one
    spread[zero] = '|' if zero
  end

  def create_display_spread
    low_num = @player1.previous < @player2.previous ? @player1.previous : @player2.previous
    high_num = @player1.score > @player2.score ? @player1.score : @player2.score

    high_num += 1 until (low_num..high_num).size > 6

    ((low_num - 2)..(high_num + 2)).to_a
  end

  def numbers_display
    spread = create_display_spread
    replace_negatives(spread)

    spread.map! do |x|
      if ['  ', '|'].include?(x)
        x
      else
        x < 10 ? " #{x}" : x
      end
    end
    spread.join(' ')
  end

  def zero_score_display(spread, piece)
    arr = Array.new(spread.size, 'O')
    arr[0] = piece
    arr[1] = piece
    arr[2] = '|'

    arr.join('  ')
  end

  def zero_previous_display(spread, piece, score)
    arr = Array.new(spread.size, 'O')
    arr[1] = piece
    arr[2] = '|'
    arr[score + 2] = piece

    arr.join('  ')
  end

  def create_player_row(spread, player)
    arr = Array.new(spread.size, 'O')
    zero = spread.index(0)
    arr[zero] = '|' if zero

    low = player.previous - spread[0]
    high = player.score - spread[0]

    arr[low] = player.piece
    arr[high] = player.piece

    arr.join('  ')
  end

  def player_row_display(player)
    spread = create_display_spread

    if player.score == 0
      zero_score_display(spread, player.piece)
    elsif player.previous == 0
      zero_previous_display(spread, player.piece, player.score)
    else
      create_player_row(spread, player)
    end
  end

  def display
    puts numbers_display
    puts ''
    puts player_row_display(@player1)
    puts player_row_display(@player2)
  end

  def get_player_adding
    puts "Enter the letter of the player adding points:"
    letter = nil
    loop do
      letter = gets.chomp.upcase
      break if [@player1.piece, @player2.piece].include?(letter)
      puts "That is not one of the players' pieces. Enter the letter:"
    end
    letter == @player1.piece ? @player1 : @player2
  end

  def get_points_to_add
    puts "how may points did they score?:"
    points = nil
    loop do
      points = gets.chomp.to_i
      break unless points == 0
      puts "Enter a number that is not 0"
    end
    points
  end

  def add_points
    player = get_player_adding
    points = get_points_to_add

    player.previous = player.score
    player.score += points
  end
end

class Game
  def initialize
    @board = Board.new
  end

  def clear_screen
    system('clear') || system('cls')
  end

  def display_board
    clear_screen
    @board.display
  end

  def add_points
    puts ''
    @board.add_points
  end

  def play
    loop do
      display_board
      add_points
      #break if winner?
    end
    display_board
    display_winner
  end
end

Game.new.play