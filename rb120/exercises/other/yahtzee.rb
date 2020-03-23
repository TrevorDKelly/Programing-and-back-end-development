# on a player's turn they roll 5 dice. they can keep as many as theu want and
# reroll as many as they want. a player has a score sheet and must fill one spot
# on the sheet on each turn. if the dice do not match any score left on the sheet
# they must scratch an untaken score.

# player
#   roll
#   reroll
# dice
# scorecard
#   score/scratch

# +-----+
# |.....|
# |  0  |
# |    0|
# +-----+
class Die
  attr_accessor :value
  FACES = (1..6).to_a

  def initialize
    @value = nil
  end

  def roll
    self.value = FACES.sample
  end

  def to_s
    value
  end

  def value_face
    case value
    when 1 then ["+-----+", "|     |", "|  0  |", "|     |", "+-----+"]
    when 2 then ["+-----+", "| 0   |", "|     |", "|   0 |", "+-----+"]
    when 3 then ["+-----+", "|0    |", "|  0  |", "|    0|", "+-----+"]
    when 4 then ["+-----+", "| 0 0 |", "|     |", "| 0 0 |", "+-----+"]
    when 5 then ["+-----+", "|0   0|", "|  0  |", "|0   0|", "+-----+"]
    when 6 then ["+-----+", "| 0 0 |", "| 0 0 |", "| 0 0 |", "+-----+"]
    end
  end
end

class Player
  attr_reader :hand, :scorecard

  def initialize
    @hand = Array.new(5) { Die.new }
    @scorecard = Scorecard.new
  end

  def start_turn
    hand.each(&:roll)
  end

  def reroll(*dice)
    dice.each { |die| hand[die].roll }
  end

  def display_hand
    puts ''
    5.times do |row|
      hand.each { |die| print die.value_face[row] + ' ' }
      puts ''
    end
    (1..5).each { |num| print "  ##{num}    " }
    puts "\n\n"
  end
end

class Scorecard
  def initialize
    @scores = nil
  end

  def markable_spots(hand)
    values = hand.collect(&:value)
  end
end

class YahtzeeGame
  attr_reader :player

  def initialize
    @player = Player.new
  end

  def player_starts
    player.start_turn
  end

  def pick_reroll_dice
    puts "Enter the numbers of any die you want to reroll separated by a space"
    dice = []
    loop do
      dice = gets.chomp.split.map(&:to_i)
      break if dice.all? { |die| (1..5).cover?(die) }
      puts "Only enter the die numbers you want to reroll separated by a space"
    end
    dice.map { |die_num| die_num - 1 }
  end

  def turn_done?
    puts "Do you want to reroll any dice? (y/n)"
    answer = nil
    loop do
      answer = gets.chomp
      break if %w(y n).include?(answer)
      puts "Enter either 'y' or 'n'"
    end
    answer == 'n'
  end

  def show_markable_spots

  end

  def play
    loop do
      player_starts
      player.display_hand
      2.times do
        break if turn_done?
        player.reroll(*pick_reroll_dice)
        player.display_hand
      end
      show_markable_spots
      player_marks_score
      break if all_scores_marked?
    end
    display_score
    display_goodbye_message
  end
end

YahtzeeGame.new.play