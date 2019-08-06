require 'pry'

PLAYER = 'X'
COMPUTER = 'O'
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9],
                 [1, 4, 7], [2, 5, 8], [3, 6, 9],
                 [1, 5, 9], [3, 5, 7]]
FIRST_MOVE = 'choose'

def choose_who_goes_first
  system("clear") || system("cls")
  answer = ''
  loop do
    puts "Who should go first? Enter Player or Computer"
    answer = gets.chomp.downcase
    break if answer == 'player' || answer == 'computer'
    puts "**That's not a valid answer!**"
  end

  answer
end

def who_goes_first
  case FIRST_MOVE
  when 'player'   then 'player'
  when 'computer' then 'computer'
  else choose_who_goes_first
  end
end

# rubocop:disable Metrics/AbcSize
def display_board(brd)
  system("clear") || system("cls")
  puts "First to 5 wins! Player is #{PLAYER} and Computer is #{COMPUTER}"
  puts ''
  puts "   |   |   "
  puts " #{brd[1]} | #{brd[2]} | #{brd[3]} "
  puts "   |   |   "
  puts "-----------"
  puts "   |   |   "
  puts " #{brd[4]} | #{brd[5]} | #{brd[6]} "
  puts "   |   |   "
  puts "-----------"
  puts "   |   |   "
  puts " #{brd[7]} | #{brd[8]} | #{brd[9]} "
  puts "   |   |   "
end
# rubocop:enable Metrics/AbcSize

def new_board!(brd)
  9.times { |i| brd[i + 1] = ' ' }
end

def available_squares(brd)
  brd.keys.select { |sqr| brd[sqr] == ' ' }
end

def player_picks_spot!(brd)
  puts "Choose a Square! (#{joinor(available_squares(brd))})"

  answer = 0
  loop do
    answer = gets.chomp.to_i
    break if available_squares(brd).include?(answer)
    puts "*That's not an available Square! Try again!*"
  end

  brd[answer] = PLAYER
end

def best_square(brd)
  pieces = [COMPUTER, PLAYER]

  pieces.each do |piece|
    taken_spots = brd.select { |_, mark| mark == piece }.keys

    WINNING_LINES.each do |line|
      if line.count { |sqr| taken_spots.include?(sqr) } == 2 &&
         line.count { |sqr| available_squares(brd).include?(sqr) } == 1
        return line.select { |sqr| brd[sqr] == ' ' }.first
      end
    end
  end

  nil
end

def computer_picks_spot!(brd)
  sqr = best_square(brd)
  sqr = 5 if available_squares(brd).include?(5) && !sqr
  sqr = available_squares(brd).sample if !sqr
  brd[sqr] = COMPUTER
end

def check_for_winner(brd)
  who_won = nil

  who_won = "It's a Tie!" if available_squares(brd).empty?

  WINNING_LINES.any? do |line|
    who_won = 'Player Won!' if line.all? { |sqr| brd[sqr] == 'X' }
    who_won = 'Computer Won!' if line.all? { |sqr| brd[sqr] == 'O' }
  end

  who_won
end

def play_again?
  puts "Would you like to play again? (y or n)"
  answer = gets.chomp.downcase

  answer.start_with?('y')
end

def joinor(arr, separator = ',', last_separator = 'or')
  count = 0
  string = ''

  loop do
    string << arr[count].to_s
    count += 1
    break if count == arr.length

    string << if arr.length - count > 1
                "#{separator} "
              else
                " #{last_separator} "
              end
  end

  string
end

def play_turn(brd, current_turn)
  if current_turn == 'player'
    player_picks_spot!(brd)
  else
    computer_picks_spot!(brd)
  end
end

def change_turn(current_turn)
  if current_turn == 'player'
    'computer'
  else
    'player'
  end
end

def play_a_round(brd, first_turn)
  current_turn = first_turn
  loop do
    display_board(brd)
    play_turn(brd, current_turn)
    current_turn = change_turn(current_turn)
    break if check_for_winner(brd)
  end

  check_for_winner(brd)
end

board = {}

loop do
  player_wins = 0
  computer_wins = 0
  game_count = 0

  first_turn = who_goes_first

  loop do
    game_count += 1
    new_board!(board)

    winner = play_a_round(board, first_turn)

    player_wins += 1 if winner == 'Player Won!'
    computer_wins += 1 if winner == 'Computer Won!'

    display_board(board)

    puts winner

    if player_wins == 5
      puts "Player won 5 games!"
      break
    elsif computer_wins == 5
      puts "The Computer won 5 games!"
      break
    else
      puts "SCORE: Player => #{player_wins} | Computer => #{computer_wins}"
      puts "Press enter to start game #{game_count + 1}!"
      gets.chomp
    end
  end

  break if !play_again?
end
