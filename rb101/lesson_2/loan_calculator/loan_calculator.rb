# Loan Calculator

require 'yaml'
MESSAGES = YAML.load_file('loan_messages.yml')

# Methods
def prompt(message)
  puts "::> #{MESSAGES[message]}"
end

def valid_number?(input)
  /\d/.match(input) && /^\d*\.?\d*$/.match(input)
end

def monthly_payment_calculator(amount, rate, duration)
  # m = p * (j / (1 - (1 + j)**(-n)))
  amount * (rate / (1 - (1 + rate)**(duration * -1)))
end

# Main program
prompt('welcome')

# main loop
loop do
  # variables
  start_loan_amount = 0
  working_loan_amount = 0
  rate = 0
  duration = 0
  total_paid = 0
  monthly_payment = 0

  # Get input from user
  prompt('amount')
  loop do
    start_loan_amount = gets.chomp
    if valid_number?(start_loan_amount)
      start_loan_amount = start_loan_amount.to_f
      working_loan_amount = start_loan_amount
      break
    end
    prompt('amount_error')
  end

  prompt('apr')
  loop do
    rate = gets.chomp
    if valid_number?(rate)
      rate = rate.to_f / 12 * 0.01
      break
    end
    prompt('apr_error')
  end

  prompt('duration')
  loop do
    duration = gets.chomp
    if valid_number?(duration)
      duration = duration.to_f * 12
      break
    end
    prompt('duration_error')
  end

  # Calculate monthly rate
  monthly_payment =
    monthly_payment_calculator(start_loan_amount, rate, duration)

  # Calculate total payment and interest paid
  loop do
    working_loan_amount *= (rate + 1)
    if working_loan_amount <= monthly_payment
      total_paid += working_loan_amount
      break
    else
      total_paid += monthly_payment
      working_loan_amount -= monthly_payment
    end
  end

  interest_paid = total_paid - start_loan_amount

  # Output
  puts "Your monthly payment will be $#{monthly_payment.round(2)}"
  puts "The total you will pay is $#{total_paid.round(2)}"
  puts "The amount you will pay in interest is $#{interest_paid.round(2)}"
  puts "\n"
  
  # start again?
  again = nil
  prompt('again?')
  loop do
    again = gets.chomp.downcase
    
    if again == 'y' || again == 'n'
      break
    else 
      prompt('again_error')
    end
  end
  
  unless again == 'n'
    next
  end
  
  prompt('goodbye')
end
