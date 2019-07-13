# Loan Calculator

require 'yaml'
MESSAGES = YAML.load_file('loan_messages.yml')

# Methods
def prompt(message)
  puts "::> #{MESSAGES[message]}"
end

def valid_number?(input)
  /\d/.match(input) && /^\d*\.?\d*$/.match(input) && input.to_f > 0
end

def monthly_payment_calculator(amount, rate, duration)
  # m = p * (j / (1 - (1 + j)**(-n)))
  amount * (rate / (1 - (1 + rate)**(duration * -1)))
end

# variables
start_loan_amount ||= 0
working_loan_amount = 0
rate ||= 0
duration ||= 0
total_paid = 0
monthly_payment = 0
adjusting = false

# Main program
prompt('welcome')

# main loop
loop do
  if adjusting
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
      when '1'
        prompt('amount')
        loop do
          print '$'
          start_loan_amount = gets.chomp
          if valid_number?(start_loan_amount)
            start_loan_amount = start_loan_amount.to_f
            working_loan_amount = start_loan_amount
            break
          end
          prompt('amount_error')
        end
      when '2'
        prompt('apr')
        loop do
          rate = gets.chomp
          if valid_number?(rate) && rate.to_f < 100
            rate = rate.to_f / 12 * 0.01
            break
          end
          prompt('apr_error')
        end
      else
        prompt('duration')
        loop do
          duration = gets.chomp
          if valid_number?(duration)
            duration = duration.to_f * 12
            break
          end
          prompt('duration_error')
        end
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
  else # if new or not adjusting paramiters
    # Get input from user
    prompt('amount')
    loop do
      print '$'
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
      if valid_number?(rate) && rate.to_f < 100
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
  end

  # Calculate monthly payment
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

  # start again, change, or exit?
  again = nil
  prompt('again')
  prompt('again_list')
  loop do
    again = gets.chomp.downcase
    again_options = ['change', 'new', 'exit']
    break if again_options.include?(again)
    prompt('again_error')
  end

  case again
  when 'change'
    adjusting = true
    next
  when 'new'
    adjusting = false
    next
  else
    prompt('goodbye')
    break
  end
end
