class TTTGame
  attr_reader :board, :human, :computer, :whos_turn

  def initialize
    create_new_board
    @human = Human.new
    @computer = Computer.new
    @whos_turn = human.marker
  end

  def play
    clear
    display_welcome_message

    loop do
      loop do
        play_one_round

        break if someone_won_game?

        prompt_to_start_next_round
        display_next_round_message
      end

      display_end_of_game

      break unless play_again?
      reset_for_new_game
      display_play_agian_message
    end

    display_goodbye_message
  end

  private

  def play_one_round
    display_board

    loop do
      current_player_turn
      break if board.full? || board.someone_won?
      clear_screen_and_display_board if human_turn?
    end

    display_round_winner
  end

  def prompt_to_start_next_round
    print 'Hit Enter to start the next round!'
    gets
    reset_for_new_round
  end

  def clear
    system('cls') || system('clear')
  end

  def display_welcome_message
    puts "Hi #{human.name}! Welcome to Tick Tac Toe!"
  end

  def display_goodbye_message
    puts "Thanks for Playing!"
  end

  def create_new_board
    @board = Board.new
  end

  def display_board
    puts ''
    board.draw
    puts ''
  end

  def clear_screen_and_display_board
    clear
    display_score
    display_board
  end

  def human_turn
    choice = nil

    puts "Choose a square:(#{board.display_unmarked_square_numbers})"

    loop do
      choice = gets.chomp.to_i
      break if board.unmarked_keys.include?(choice)
      puts 'Thats not an available spot!'
    end

    board[choice] = human.marker
  end

  def computer_turn
    board[computer_best_move] = computer.marker
  end

  def computer_pick_random
    board.unmarked_keys.sample
  end

  def computer_best_move
    [computer.marker, human.marker]. each do |marker|
      if board.can_win?(marker)
        return board.win_spot(marker)
      end
    end

    board.center_available? ? 5 : computer_pick_random
  end

  def someone_won_game?
    human.score == 5 || computer.score == 5
  end

  def display_round_winner_message(winner)
    puts "#{winner.name} won this round!"
  end

  def display_round_winner
    clear_screen_and_display_board

    case board.winning_marker
    when human.marker
      display_round_winner_message(human)
      human.score += 1
    when computer.marker
      display_round_winner_message(computer)
      computer.score += 1
    else
      puts 'The board is full!'
    end
    display_score
  end

  def display_score
    puts "The score is #{human.name}: #{human.score} to "\
         "#{computer.name}: #{computer.score}"
  end

  def play_again?
    answer = nil

    puts 'Would you like to play again? (y/n)'

    loop do
      answer = gets.chomp.downcase
      break if %w(y n).include?(answer)
      puts "Enter either 'y' or 'n'"
    end

    answer == 'y'
  end

  def reset_for_new_round
    create_new_board
    clear
  end

  def reset_for_new_game
    reset_for_new_round
    human.score = 0
    computer.score = 0
  end

  def determine_game_winner
    human.score > computer.score ? human.name : computer.name
  end

  def display_end_of_game
    clear_screen_and_display_board

    puts "#{determine_game_winner} won!\n\n"\
         "The final score was #{human.name}: #{human.score} to "\
         "#{computer.name}: #{computer.score}\n\n"
  end

  def display_play_agian_message
    puts 'Lets Play Again!'
  end

  def display_next_round_message
    puts 'Starting the next game!'
    display_score
  end

  def current_player_turn
    if human_turn?
      human_turn
      @whos_turn = computer.marker
    else
      computer_turn
      @whos_turn = human.marker
    end
  end

  def human_turn?
    whos_turn == human.marker
  end
end

class Board
  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9],
                   [1, 4, 7], [2, 5, 8], [3, 6, 9],
                   [1, 5, 9], [7, 5, 3]]

  def initialize
    @squares = {}
    (1..9).each { |k| @squares[k] = Square.new }
  end

  def draw
    puts "   |   |   \n"\
         " #{@squares[1]} | #{@squares[2]} | #{@squares[3]} \n"\
         "   |   |   \n"\
         "---+---+---\n"\
         "   |   |   \n"\
         " #{@squares[4]} | #{@squares[5]} | #{@squares[6]} \n"\
         "   |   |   \n"\
         "---+---+---\n"\
         "   |   |   \n"\
         " #{@squares[7]} | #{@squares[8]} | #{@squares[9]} \n"\
         "   |   |   "
  end

  def []=(spot, marker)
    @squares[spot].mark = marker
  end

  def unmarked_keys
    @squares.keys.select { |key| @squares[key].not_taken? }
  end

  def display_unmarked_square_numbers
    string = ''
    unmarked_keys.each do |num|
      string << num.to_s
      string << if unmarked_keys[-1] == num
                  ''
                elsif unmarked_keys[-2] == num
                  ', or '
                else
                  ', '
                end
    end
    string
  end

  def full?
    unmarked_keys.empty?
  end

  def winning_marker
    WINNING_LINES.each do |line|
      squares = @squares.values_at(*line)

      next if squares.any?(&:not_taken?)

      if three_matching_squares?(squares)
        return squares.first.mark
      end
    end

    nil
  end

  def win_spot(marker)
    WINNING_LINES.each do |line|
      squares = @squares.values_at(*line)

      next unless ((squares.count { |square| square.mark == marker }) == 2) &&
                  (squares.count(&:not_taken?)) == 1

      win_square = squares.index(&:not_taken?)
      return line[win_square]
    end
    nil
  end

  def can_win?(marker)
    !!win_spot(marker)
  end

  def center_available?
    @squares[5].not_taken?
  end

  def someone_won?
    !!winning_marker
  end

  private

  def three_matching_squares?(squares)
    (squares.count { |square| square == squares[0] }) == 3
  end
end

class Square
  UNMARKED_SQUARE = ' '

  attr_accessor :mark

  def initialize
    @mark = UNMARKED_SQUARE
  end

  def to_s
    @mark
  end

  def not_taken?
    mark == UNMARKED_SQUARE
  end

  def ==(other)
    mark == other.mark
  end
end

class Player
  VALID_MARKERS = ('a'..'z').to_a + ('A'..'Z').to_a + ('0'..'9').to_a

  attr_accessor :marker, :score
  attr_reader :name

  def initialize
    set_name
    set_marker
    @score = 0
  end
end

class Computer < Player
  def set_name
    @name = %w(Bob Tom Jack Harry).sample
  end

  def set_marker
    @marker = VALID_MARKERS.sample
  end
end

class Human < Player
  def set_name
    name = nil

    loop do
      puts "What's your name?"
      name = gets.chomp
      break unless name.empty?
      puts 'You have to enther a name'
    end

    @name = name
  end

  def set_marker
    choice = nil

    loop do
      puts 'Pick a letter or number to use as your marker:'
      choice = gets.chomp
      case validate_choice(choice)
      when 'good'       then break
      when 'size error' then puts 'Marker must be 1 character'
      when 'char error' then puts 'Marker must be a letter or a number'
      end
    end

    self.marker = choice
  end

  def validate_choice(choice)
    return 'size error' unless choice.size == 1
    return 'char error' unless VALID_MARKERS.include?(choice)
    'good'
  end
end

game = TTTGame.new
game.play
