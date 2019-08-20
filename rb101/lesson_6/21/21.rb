SUITS = ["\u2664", "\u2660", "\u2661", "\u2665",
         "\u2667", "\u2663", "\u2662", "\u2666"]

TARGET_TOTAL = 21
DEALER_STOP_POINT = 17

def create_new_deck
  deck = {}
  SUITS.each do |suit|
    (2..10).each { |num| deck[num.to_s + suit] = num }
    %w(K Q J).each { |face| deck[face.to_s + suit] = 10 }
    deck["A#{suit}"] = 'ace'
  end
  deck.to_a.shuffle.to_h
end

def deal_new_hand!(deck, player_hand, dealer_hand)
  system('clear') || system('cls')
  hit!(deck, player_hand)
  4.times { puts '' }
  puts top_card_visual(player_hand.keys[0])
  sleep 1
  hit!(deck, dealer_hand)
  dealer_turn = true
  display(player_hand, dealer_hand, dealer_turn)
  sleep 1
  hit!(deck, player_hand)
  display(player_hand, dealer_hand, dealer_turn)
  sleep 1
  hit!(deck, dealer_hand)
end

def valid_hit_or_stay?(input)
  input == 'hit' || input == 'stay'
end

def hit?
  puts "Would you like to hit or stay? Enter 'Hit' or 'Stay'"
  answer = ''
  loop do
    answer = gets.chomp.downcase
    break if valid_hit_or_stay?(answer)
    puts "That's not a valid input! Enter 'Hit' or 'Stay'"
  end
  answer == 'hit'
end

def hit!(deck, hand)
  new_card = []
  new_card << deck.shift

  hand.merge!(new_card.to_h)
end

def top_card_visual(card)
  card_display = []
  card_display[0] = " __________ "
  card_display[1] = if card.include?('10')
                      "| #{card}      |"
                    else
                      "| #{card}       |"
                    end
  card_display[2] = "|    /\\    |"
  card_display[3] = "|   //\\\\   |"
  card_display
end

def bottom_cards_visual(card)
  card_display = []
  card_display[0] = " ____"
  card_display[1] = if card.include?('10')
                      "| #{card}"
                    else
                      "| #{card} "
                    end
  card_display[2] = "|   /"
  card_display[3] = "|  //"
  card_display
end

def hand_visual(cards)
  display = ['', '', '', '']
  cards.each_with_index do |(card, _), index|
    if index < cards.size - 1
      bottom_cards_visual(card).each_with_index do |display_row, row|
        display[row] += display_row
      end
    else
      top_card_visual(card).each_with_index do |display_row, row|
        display[row] += display_row
      end
    end
  end

  display[1] += " Total is #{calculate_hand_total(cards)}"

  display
end

def dealer_hidden_card_visual
  card_display = []
  card_display[0] = " __________ "
  card_display[1] = "|XxXxXxXxXx|"
  card_display[2] = "|xXxXxXxXxX|"
  card_display[3] = "|XxXxXxXxXx|"
  card_display
end

def dealer_hidden_hand_value(cards)
  if cards.first[1] == 'ace'
    11
  else
    cards.first[1]
  end
end

def dealer_hidden_hand_display(cards)
  display = ['', '', '', '']
  cards.each_with_index do |(card, _), index|
    if index < cards.size - 1
      bottom_cards_visual(card).each_with_index do |display_row, row|
        display[row] += display_row
      end
    else
      dealer_hidden_card_visual.each_with_index do |display_row, row|
        display[row] += display_row
      end
    end
  end

  display[1] += " Dealer is showing #{dealer_hidden_hand_value(cards)}"

  display
end

def calculate_hand_total(cards)
  total = 0

  cards.each do |_, value|
    next if value == 'ace'
    total += value
  end

  aces = cards.select { |_, value| value == 'ace' }

  aces.each_with_index do |_, index|
    total += if index + 1 != aces.size || total > 10
               1
             elsif total < 11
               11
             end
  end

  total
end

def bust?(cards)
  calculate_hand_total(cards) > TARGET_TOTAL
end

def display(player_hand, dealer_hand, show_dealer_cards = false)
  system("clear") || system("cls")

  if show_dealer_cards
    puts hand_visual(dealer_hand)
  else
    puts dealer_hidden_hand_display(dealer_hand)
  end

  puts hand_visual(player_hand)
end

def player_turn!(deck, player_hand, dealer_hand)
  loop do
    display(player_hand, dealer_hand)
    if hit?
      hit!(deck, player_hand)
      break if bust?(player_hand)
    else
      break
    end
  end
end

def dealer_turn!(deck, player_hand, dealer_hand)
  dealer_turn = true

  loop do
    display(player_hand, dealer_hand, dealer_turn)
    sleep 1
    break if bust?(dealer_hand) ||
             calculate_hand_total(dealer_hand) >= DEALER_STOP_POINT
    hit!(deck, dealer_hand)
  end
end

def play_again?
  puts "Would you like to play again? (y or n)"
  answer = gets.chomp

  answer.start_with?('y')
end

def blackjack?(cards)
  calculate_hand_total(cards) == 21
end

def compare_hands(player_hand, dealer_hand)
  if calculate_hand_total(player_hand) > calculate_hand_total(dealer_hand)
    'player'
  elsif calculate_hand_total(player_hand) < calculate_hand_total(dealer_hand)
    'dealer'
  else
    'push'
  end
end

def who_wins(player_hand, dealer_hand)
  if bust?(player_hand) || blackjack?(dealer_hand)
    'dealer'
  elsif bust?(dealer_hand) || blackjack?(player_hand)
    'player'
  else
    compare_hands(player_hand, dealer_hand)
  end
end

loop do
  player_wins = 0
  dealer_wins = 0

  loop do
    deck = create_new_deck
    player_hand = {}
    dealer_hand = {}

    deal_new_hand!(deck, player_hand, dealer_hand)

    if !blackjack?(player_hand)
      player_turn!(deck, player_hand, dealer_hand)

      if !bust?(player_hand)
        dealer_turn!(deck, player_hand, dealer_hand)
      else
        display(player_hand, dealer_hand)
        puts "You bust!!"
      end
    else
      display(player_hand, dealer_hand)
      puts "You Got Blackjack!!"
    end

    winner = who_wins(player_hand, dealer_hand)

    case winner
    when 'player'
      player_wins += 1
      puts "You beat the dealer!"
    when 'dealer'
      dealer_wins += 1
      puts "The dealer won this hand."
    else
      puts "It's a draw, neither side wins."
    end

    break if player_wins == 5 || dealer_wins == 5

    puts "Hit enter to start the next game!"
    gets
  end

  if dealer_wins > player_wins
    puts "The Dealer won #{dealer_wins} to #{player_wins}"
  else
    puts "The Dealer won #{player_wins} to #{dealer_wins}"
  end

  break if !play_again?
end
