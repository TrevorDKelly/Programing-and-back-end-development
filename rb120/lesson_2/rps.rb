class Player
  attr_accessor :name, :move, :wins, :stats

  def initialize
    set_name
    @move = nil
    @wins = 0
    create_stats_hash
  end

  def wins_game
    puts "#{name} won!"
    self.wins += 1
  end

  def create_stats_hash
    @stats = { Rock => 0, Paper => 0, Scissors => 0,
               Spock => 0, Lizard => 0 }
  end

  def add_move_to_stats
    @stats[move.class] += 1
  end

  def to_s
    "Player: #{name}\n" \
    "Stats:\n" \
    "  Rock: #{stats[Rock]}\n" \
    "  Paper: #{stats[Paper]}\n" \
    "  Scissors: #{stats[Scissors]}\n" \
    "  Lizard: #{stats[Lizard]}\n" \
    "  Spock: #{stats[Spock]}"
  end
end

class Human < Player
  def choose
    m = nil
    loop do
      puts "Choose: (R)ock  |  (P)aper  |  (S)cissors  |  (SP)ock  |  (L)izard"
      m = gets.chomp.downcase
      break if %w(r p s sp l).include?(m)
      puts "!#### Enter either 'R', 'P', 'S', 'SP', or 'L' ####!"
    end
    self.move = convert_move_to_object(m)
    add_move_to_stats
  end

  def convert_move_to_object(m)
    case m
    when 'r'  then Rock.new
    when 'p'  then Paper.new
    when 's'  then Scissors.new
    when 'sp' then Spock.new
    when 'l'  then Lizard.new
    end
  end

  def set_name
    n = ''
    loop do
      print "Enter your name: "
      n = gets.chomp
      break unless n.empty?
      puts "!#### Name can't be empty ####!"
    end
    self.name = n
  end
end

class Computer < Player
  def choose
    self.move = case name
                when 'Rocky' then rocky_moves
                when 'Edward' then edward_moves
                when 'Spock' then spock_moves
                when 'Tom' then tom_moves
                end
    add_move_to_stats
  end

  def rocky_moves
    Rock.new
  end

  def edward_moves
    [Scissors.new, Spock.new].sample
  end

  def spock_moves
    moves = [Scissors.new]
    9.times { moves << Spock.new }
    moves.sample
  end

  def tom_moves
    [Rock.new, Paper.new, Scissors.new, Spock.new, Lizard.new].sample
  end

  def set_name
    @name = %w(Rocky Edward Spock Tom).sample
  end
end

class Rock
  def beats?(other)
    (other.class == Lizard) || (other.class == Scissors)
  end

  def to_s
    'rock'
  end
end

class Paper
  def beats?(other)
    (other.class == Rock) || (other.class == Spock)
  end

  def to_s
    'paper'
  end
end

class Scissors
  def beats?(other)
    (other.class == Paper) || (other.class == Lizard)
  end

  def to_s
    'scissors'
  end
end

class Spock
  def beats?(other)
    (other.class == Rock) || (other.class == Scissors)
  end

  def to_s
    'spock'
  end
end

class Lizard
  def beats?(other)
    (other.class == Paper) || (other.class == Spock)
  end

  def to_s
    'lizard'
  end
end

class RPSGame
  attr_reader :human, :computer, :target_score

  def initialize(target_score)
    display_welcome_message
    @human = Human.new
    @computer = Computer.new
    @target_score = target_score
    p human.stats
    p computer.stats
  end

  def display_welcome_message
    system('cls') || system('clear')
    puts "\nWelcome to Rock, Paper, Scissors!\n\n"
  end

  def display_goodbye_message
    system('cls') || system('clear')
    puts "\nThanks for Playing!\n\n"
  end

  def show_moves
    puts "#{human.name} chose #{human.move} || " \
           "#{computer.name} chose #{computer.move}"
  end

  def display_winner
    if human.move.beats?(computer.move)
      human.wins_game
    elsif computer.move.beats?(human.move)
      computer.wins_game
    else
      puts "It's a tie!"
    end
  end

  def display_stats
    puts human
    puts computer
  end

  def play_again?
    answer = nil
    loop do
      puts "Do you want to play again? (y/n) or enter 'stats' to see stats"
      answer = gets.chomp
      if answer == 'stats'
        display_stats
        next
      end
      break if ['y', 'n'].include?(answer)
      puts "Enter either 'y', 'n', or 'stats'"
    end

    answer == 'y'
  end

  def display_header
    width = 45
    system('cls') || system('clear')
    puts "ROCKS PAPER SCISSORS".center(width)
    puts "#{human.name} vs #{computer.name}".center(width)
    puts "SCORE".center(width)
    puts "#{human.wins} || #{computer.wins}".center(width)
  end

  def play_set
    display_header
    loop do
      human.choose
      computer.choose
      display_header
      show_moves
      display_winner
      break if (human.wins >= target_score) || (computer.wins >= target_score)
    end
  end

  def reset_score
    human.wins = 0
    computer.wins = 0
  end

  def play
    loop do
      play_set
      break unless play_again?
      reset_score
    end
    display_goodbye_message
  end
end

RPSGame.new(5).play
