# Loan Calculator

require 'yaml'
MESSAGES = YAML.load_file('loan_messages.yml')

# Methods
def prompt(message)
  puts "::> #{MESSAGES[message]}"
end

def valid_float?(input)
  /\d/.match(input) && /^\d*\.?\d*$/.match(input) && input.to_f > 0
end

def aquire_loan_amount
  loan_amount = ''
  prompt('amount')
  loop do
    print '$'
    loan_amount = gets.chomp
    if valid_float?(loan_amount)
      loan_amount = loan_amount.to_f
      break
    end
    prompt('amount_error')
  end
  loan_amount
end

def aquire_rate
  rate = ''
  prompt('apr')
  loop do
    rate = gets.chomp
    if valid_float?(rate) && rate.to_f < 100
      rate = rate.to_f / 12 / 100
      break
    end
    prompt('apr_error')
  end
  rate
end

def aquire_duration
  duration = ''
  prompt('duration')
  loop do
    duration = gets.chomp
    if valid_float?(duration)
      duration = duration.to_f * 12
      break
    end
    prompt('duration_error')
  end
  duration
end

def monthly_payment_calculator(loan_amount, rate, duration)
  # m = p * (j / (1 - (1 + j)**(-n)))
  loan_amount * (rate / (1 - (1 + rate)**(duration * -1)))
end

def change_new_or_exit
  again = ''
  prompt('again')
  prompt('again_list')
  loop do
    again = gets.chomp.downcase
    again_options = ['change', 'new', 'exit']
    break if again_options.include?(again)
    prompt('again_error')
  end
  again
end

def calculate_total_payment(loan_amount, monthly_payment, rate)
  total_paid = 0
  while loan_amount > monthly_payment
    loan_amount *= (rate + 1)
    total_paid += monthly_payment
    loan_amount -= monthly_payment
  end
  total_paid += loan_amount
end

# variables
loan_amount = 0
rate = 0
duration = 0
total_paid = 0
monthly_payment = 0
start_from_scratch = true

# Main program
prompt('welcome')

# main loop
loop do
  if start_from_scratch
    # Get input from user
    loan_amount = aquire_loan_amount
    rate = aquire_rate
    duration = aquire_duration
  else
    # Which paramiters to change
    loop do
      prompt('change')
      prompt('change_list')
      being_adjusted = nil
      loop do
        being_adjusted = gets.chomp
        break if being_adjusted.to_i > 0 && being_adjusted.to_i < 4
        prompt('change_error')
        prompt('change_list')
      end
      case being_adjusted
      when '1' then loan_amount = aquire_loan_amount
      when '2' then rate = aquire_rate
      else          duration = aquire_duration
      end # End of case being_adjusted

      # Change another paramiter?
      answer = nil
      loop do
        prompt('change_another')
        answer = gets.chomp.downcase
        break if answer == 'y' || answer == 'n'
        prompt('y_or_n_error')
      end
      break if answer == 'n'
    end
  end

  # Calculate monthly payment
  monthly_payment = monthly_payment_calculator(loan_amount, rate, duration)

  # Calculate total payment and interest paid
  total_paid = calculate_total_payment(loan_amount, monthly_payment, rate)
  interest_paid = total_paid - loan_amount

  # Output
  puts "Your monthly payment will be $#{monthly_payment.round(2)}"
  puts "The total you will pay is $#{total_paid.round(2)}"
  puts "The amount you will pay in interest is $#{interest_paid.round(2)}"
  puts "\n"

  # start again, change, or exit?
  again = change_new_or_exit
  case again
  when 'change'
    start_from_scratch = false
    next
  when 'new'
    start_from_scratch = true
    next
  else
    prompt('goodbye')
    break
  end
end
