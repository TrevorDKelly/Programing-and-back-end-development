class GuessingGame
  attr_accessor :number, :guesses_left, :guess
  attr_reader :game_range, :number_of_guesses

  class GivenRangeError < StandardError; end

  def initialize(range_start, range_end)
    set_game_range(range_start, range_end)
    set_number_of_guesses
  end

  def set_game_range(range_start, range_end)
    unless range_start.class == Integer && range_end.class == Integer
      raise GivenRangeError, 'Range Must Be Two Integers'
    end
    small_to_large = [range_start, range_end].sort
    @game_range = (small_to_large[0]..small_to_large[1]).to_a
  end

  def set_number_of_guesses
    @number_of_guesses = Math.log2(game_range.size).to_i + 1
  end 

  def set_up_new_game
    @number = game_range.sample
    @guesses_left = number_of_guesses
  end

  def show_guesses_remaining
    puts(case guesses_left
         when 1 then 'You have 1 guess remaining'
         else "You have #{guesses_left} guesses remaining"
         end)
  end

  def user_guess
    show_guesses_remaining
    g = nil

    loop do
      print "Enter a number between #{game_range[0]} "\
              "and #{game_range[-1]}: "
      g = gets.chomp.to_i
      break if game_range.include?(g)
      print "\nInvalid guess. "
    end
    self.guess = g
    self.guesses_left -= 1
  end

  def compare_guess_and_number
    if correct?
      puts "That's the number!"
    elsif guess > number
      puts 'Your guess is too high'
    else
      puts 'Your guess is too low'
    end
    puts ''
  end

  def correct?
    guess == number
  end

  def no_more_guesses?
    guesses_left == 0
  end

  def display_game_outcome
    puts(correct? ? 'You won!' : 'You have no more guesses. You lost!')
  end

  def play
    set_up_new_game
    loop do
      user_guess
      compare_guess_and_number
      break if correct? || no_more_guesses?
    end
    display_game_outcome
  end
end

game = GuessingGame.new(501, 200)
game.play
