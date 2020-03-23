class Deck
  RANKS = ((2..10).to_a + %w(Jack Queen King Ace)).freeze
  SUITS = %w(Hearts Clubs Diamonds Spades).freeze

  attr_reader :cards

  def initialize
    create_new_deck
  end

  def draw
    create_new_deck if cards.empty?
    cards.pop
  end

  private

  def create_new_deck
    @cards = []
    RANKS.each do |rank|
      SUITS.each do |suit|
        cards << Card.new(rank, suit)
      end
    end
    cards.shuffle!
  end
end

class Card
  include Comparable

  RANK_ARRAY = (2..10).to_a + %w(Jack Queen King Ace)

  attr_reader :rank, :suit

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def <=>(other)
    RANK_ARRAY.index(rank) <=> RANK_ARRAY.index(other.rank)
  end

  def to_s
    "#{rank} of #{suit}"
  end

  def -(other)
    RANK_ARRAY.index(rank) - RANK_ARRAY.index(other.rank)
  end
end

class PokerHand
  attr_reader :hand, :rank_counts

  def initialize(deck)
    create_new_hand(deck)
    create_rank_counts_array
  end

  def print
    puts hand
  end

  def evaluate
    case
    when royal_flush?     then 'Royal flush'
    when straight_flush?  then 'Straight flush'
    when four_of_a_kind?  then 'Four of a kind'
    when full_house?      then 'Full house'
    when flush?           then 'Flush'
    when straight?        then 'Straight'
    when three_of_a_kind? then 'Three of a kind'
    when two_pair?        then 'Two pair'
    when pair?            then 'Pair'
    else                       'High card'
    end
  end

  private

  def create_rank_counts_array
    hash = {}
    hand.collect(&:rank).each do |rank|
      hash[rank] = hand.count { |card| card.rank == rank }
    end
    @rank_counts = hash.values.sort
  end

  def create_new_hand(deck)
    @hand = []
    5.times { hand << deck.draw }
  end

  def royal_flush?
    straight_flush? &&
      hand.any? { |card| card.rank == 'Ace' } &&
      hand.any? { |card| card.rank == 'King' }
  end

  def straight_flush?
    flush? && straight?
  end

  def four_of_a_kind?
    @rank_counts == [1, 4]
  end

  def full_house?
    @rank_counts == [2, 3]
  end

  def flush?
    hand.all? { |card| card.suit == hand.first.suit }
  end

  def straight?
    sorted_hand = hand.sort

    if sorted_hand.last.rank == 'Ace' && sorted_hand.first.rank == 2
      sorted_hand.delete_at(-1)
    end

    last_card = nil

    sorted_hand.each do |card|
      if last_card.class == Card
        return false unless (card - last_card) == 1
      end

      last_card = card
    end
  end

  def three_of_a_kind?
    @rank_counts == [1, 1, 3]
  end

  def two_pair?
    @rank_counts == [1, 2, 2]
  end

  def pair?
    @rank_counts == [1, 1, 1, 2]
  end
end

# hand = PokerHand.new(Deck.new)
# hand.print
# puts hand.evaluate

# # Danger danger danger: monkey
# # patching for testing purposes.
# class Array
#   alias_method :draw, :pop
# end

# # Test that we can identify each PokerHand type.
# hand = PokerHand.new([
#   Card.new(10,      'Hearts'),
#   Card.new('Ace',   'Hearts'),
#   Card.new('Queen', 'Hearts'),
#   Card.new('King',  'Hearts'),
#   Card.new('Jack',  'Hearts')
# ])
# puts hand.evaluate == 'Royal flush'

# hand = PokerHand.new([
#   Card.new(8,       'Clubs'),
#   Card.new(9,       'Clubs'),
#   Card.new('Queen', 'Clubs'),
#   Card.new(10,      'Clubs'),
#   Card.new('Jack',  'Clubs')
# ])
# puts hand.evaluate == 'Straight flush'

# hand = PokerHand.new([
#   Card.new(3, 'Hearts'),
#   Card.new(3, 'Clubs'),
#   Card.new(5, 'Diamonds'),
#   Card.new(3, 'Spades'),
#   Card.new(3, 'Diamonds')
# ])
# puts hand.evaluate == 'Four of a kind'

# hand = PokerHand.new([
#   Card.new(3, 'Hearts'),
#   Card.new(3, 'Clubs'),
#   Card.new(5, 'Diamonds'),
#   Card.new(3, 'Spades'),
#   Card.new(5, 'Hearts')
# ])
# puts hand.evaluate == 'Full house'

# hand = PokerHand.new([
#   Card.new(10, 'Hearts'),
#   Card.new('Ace', 'Hearts'),
#   Card.new(2, 'Hearts'),
#   Card.new('King', 'Hearts'),
#   Card.new(3, 'Hearts')
# ])
# puts hand.evaluate == 'Flush'

# hand = PokerHand.new([
#   Card.new(8,      'Clubs'),
#   Card.new(9,      'Diamonds'),
#   Card.new(10,     'Clubs'),
#   Card.new(7,      'Hearts'),
#   Card.new('Jack', 'Clubs')
# ])
# puts hand.evaluate == 'Straight'

# hand = PokerHand.new([
#   Card.new('Queen', 'Clubs'),
#   Card.new('King',  'Diamonds'),
#   Card.new(10,      'Clubs'),
#   Card.new('Ace',   'Hearts'),
#   Card.new('Jack',  'Clubs')
# ])
# puts hand.evaluate == 'Straight'

# hand = PokerHand.new([
#   Card.new(3, 'Hearts'),
#   Card.new(3, 'Clubs'),
#   Card.new(5, 'Diamonds'),
#   Card.new(3, 'Spades'),
#   Card.new(6, 'Diamonds')
# ])
# puts hand.evaluate == 'Three of a kind'

# hand = PokerHand.new([
#   Card.new(9, 'Hearts'),
#   Card.new(9, 'Clubs'),
#   Card.new(5, 'Diamonds'),
#   Card.new(8, 'Spades'),
#   Card.new(5, 'Hearts')
# ])
# puts hand.evaluate == 'Two pair'

# hand = PokerHand.new([
#   Card.new(2, 'Hearts'),
#   Card.new(9, 'Clubs'),
#   Card.new(5, 'Diamonds'),
#   Card.new(9, 'Spades'),
#   Card.new(3, 'Diamonds')
# ])
# puts hand.evaluate == 'Pair'

# hand = PokerHand.new([
#   Card.new(2,      'Hearts'),
#   Card.new('King', 'Clubs'),
#   Card.new(5,      'Diamonds'),
#   Card.new(9,      'Spades'),
#   Card.new(3,      'Diamonds')
# ])
# puts hand.evaluate == 'High card'
