require 'yaml'
MESSAGES = YAML.load_file('r_p_s_messages.yml')

WHAT_WINS = {
  rock:     %w(scissors lizard),
  paper:    %w(rock spock),
  scissors: %w(paper lizard),
  spock:    %w(rock scissors),
  lizard:   %w(spock paper)
}

VALID_CHOICES = WHAT_WINS.keys

VALID_ENTRY = %w(r p sc l sp)

def valid_wins_required?(input)
  input.to_i.between?(1, 20)
end

def win?(played, versus)
  WHAT_WINS[played.to_sym].include?(versus)
end

def round_winner(player, computer)
  if win?(player, computer)
    'player'
  elsif win?(computer, player)
    'computer'
  else
    'tie'
  end
end

def full_word(choice)
  case choice
  when 'r'  then 'rock'
  when 'p'  then 'paper'
  when 'sc' then 'scissors'
  when 'l'  then 'lizard'
  when 'sp' then 'spock'
  end
end

def prompt(message)
  puts "::> #{message}"
end

def clear_screen
  system('cls') || system('clear')
end

def display_game_info(player, computer, wins_required)
  puts("   The score is: | You: #{player} | Computer: #{computer} |")
  puts("   First to #{wins_required} wins! Enter 'Exit' to quit")
  puts ""
end

# Main Program
clear_screen
prompt(MESSAGES['welcome'])
prompt(MESSAGES['choices'])

loop do
  prompt(MESSAGES['wins_required'])

  wins_required = 0

  loop do
    wins_required = gets.chomp.to_i
    break if valid_wins_required?(wins_required)
    clear_screen
    prompt(MESSAGES['wins_required_error'])
    prompt(MESSAGES['wins_required'])
  end

  player_wins = 0
  computer_wins = 0

  clear_screen
  display_game_info(player_wins, computer_wins, wins_required)

  while (player_wins < wins_required) && (computer_wins < wins_required)
    player_choice = ''

    prompt(MESSAGES['get_choice'])
    loop do
      prompt(MESSAGES['choices'])
      player_choice = gets.chomp.downcase

      break if VALID_ENTRY.include?(player_choice) || player_choice == 'exit'

      clear_screen
      display_game_info(player_wins, computer_wins, wins_required)
      prompt(MESSAGES['invalid_entry'])
    end

    if player_choice == 'exit'
      break
    end

    computer_choice = VALID_CHOICES.sample.to_s
    player_choice = full_word(player_choice)

    clear_screen
    prompt("You chose: #{player_choice.capitalize}")
    prompt("The computer chose: #{computer_choice.capitalize}")

    case round_winner(player_choice, computer_choice)
    when 'player'
      player_wins += 1
      prompt('You Win!')
    when 'computer'
      computer_wins += 1
      prompt("The Computer won!")
    else
      prompt("It's a tie!")
    end

    display_game_info(player_wins, computer_wins, wins_required)
  end

  clear_screen

  if player_wins > computer_wins
    prompt(MESSAGES['congrats'])
    prompt("The final score is: #{player_wins} to #{computer_wins}")
  elsif computer_wins > player_wins
    prompt("Sorry, the computer won #{computer_wins} to #{player_wins}")
  else
    prompt("It ended tied at #{player_wins}")
  end

  prompt(MESSAGES['play_again'])
  play_again = gets.chomp.downcase
  break unless play_again.start_with?('y')
end

prompt(MESSAGES['goodbye'])
