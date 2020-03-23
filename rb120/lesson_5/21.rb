module CardVisuals
  def top_card_display(card)
    [",----------, #{name}'s total is #{hand_value}",
     "|#{card}#{' ' * (card.face == '10' ? 7 : 8)}|",
     "|    /`\\   |"]
  end

  def bottom_card_display(card)
    [",-----",
     "|#{card}#{' ' * (card.face == '10' ? 2 : 3)}",
     "|    /"]
  end

  def back_card_display
    [",----------, #{name} is showing #{dealer_hidden_hand_value}",
     "|\\/\\/\\/\\/\\/|",
     "|/\\/\\/\\/\\/\\|"]
  end

  def print_row(row)
    hand[0..-2].each { |card| print bottom_card_display(card)[row] }
  end

  def show_cards(hide_dealer_card: false)
    (0..2).each do |row|
      print_row(row)

      if hide_dealer_card
        print back_card_display[row]
      else
        print top_card_display(hand.last)[row]
      end
      puts ''
    end
  end
end

class Player
  include CardVisuals

  attr_accessor :hand, :name

  def initialize
    @hand = []
    set_name
  end

  def hand_value(cards = hand)
    total = 0
    aces = []

    cards.each do |card|
      if card.an_ace?
        aces << card
        next
      else
        total += card.non_ace_value
      end
    end

    add_ace_values(total, aces)
  end

  def dealer_hidden_hand_value
    hand_value([hand[0]])
  end

  def add_ace_values(total, aces)
    return total if aces.empty?

    total += aces.size - 1

    total > 10 ? (total + 1) : (total + 11)
  end

  def busted?
    hand_value > 21
  end

  def beats?(other)
    return false if busted?
    other.busted? || hand_value > other.hand_value
  end

  def clear_cards
    self.hand = []
  end
end

class Human < Player
  def hit?
    puts "Would you like to hit? (y/n)"

    answer = nil
    loop do
      answer = gets.chomp.downcase
      break if %w(y n).include?(answer)
      puts "Enter either 'y' or 'n'"
    end

    answer == 'y'
  end

  def set_name
    n = nil
    puts 'Enter your name:'
    loop do
      n = gets.chomp
      break unless n.empty?
      puts 'You have to enter a name!'
    end
    @name = n
  end
end

class Dealer < Player
  DEALER_STOP_POINT = 17

  def hit?
    hand_value < DEALER_STOP_POINT
  end

  def set_name
    @name = 'Dealer'
  end
end

class Card
  attr_reader :suit, :face

  def initialize(suit, face)
    @suit = suit
    @face = face
  end

  def non_ace_value
    return face.to_i if ('2'..'9').cover?(face)
    return 10        if %w(10 K Q J).include?(face)
  end

  def an_ace?
    face == 'A'
  end

  def to_s
    "#{face}#{suit}"
  end
end

class GameOf21
  attr_reader :deck, :human, :dealer

  def initialize
    display_welcome_message
    @human = Human.new
    @dealer = Dealer.new
    new_deck
  end

  def clear_screen
    system('cls') || system('clear')
  end

  def display_welcome_message
    clear_screen
    puts 'Welcome to 21!'
  end

  def display_goodbye_message
    puts 'Thanks for playing'
  end

  def new_deck
    @deck = []
    cards = ('2'..'9').to_a + %w(10 A K Q J)
    suits = ["\u2664", "\u2660", "\u2661", "\u2665",
             "\u2667", "\u2663", "\u2662", "\u2666"]

    suits.each do |suit|
      cards.each do |card|
        @deck << Card.new(suit, card)
      end
    end

    shuffle_deck!
  end

  def shuffle_deck!
    @deck.shuffle!
  end

  def display_game(hide_dealer_card: false)
    clear_screen
    dealer.show_cards(hide_dealer_card: hide_dealer_card)
    puts ''
    human.show_cards
  end

  def hit!(player)
    player.hand << deck.pop
  end

  def deal_hand
    2.times do
      hit!(human)
      hit!(dealer)
    end
  end

  def human_turn
    loop do
      display_game(hide_dealer_card: true)
      break unless human.hit?
      hit!(human)
      break if human.busted?
    end
  end

  def dealer_turn
    loop do
      break unless dealer.hit?
      display_game
      sleep(1)
      hit!(dealer)
      break if dealer.busted?
    end
  end

  def display_winner
    display_game
    puts ''
    if human.beats?(dealer)
      puts "#{human.name} won!"
    elsif dealer.beats?(human)
      puts "The dealer won"
    else
      puts "It's a push"
    end
  end

  def play_again?
    answer = nil
    puts 'Do you want to play another hand?(y/n)'
    loop do
      answer = gets.chomp
      break if %w(y n).include?(answer.downcase)
      puts "Enter either 'y' or 'n'"
    end

    answer == 'y'
  end

  def reset_game
    human.clear_cards
    dealer.clear_cards
    new_deck
  end

  def start
    loop do
      deal_hand

      human_turn
      dealer_turn unless human.busted?

      display_winner
      break unless play_again?
      reset_game
    end

    display_goodbye_message
  end
end

GameOf21.new.start
