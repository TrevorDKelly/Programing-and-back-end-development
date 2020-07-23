require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < Minitest::Test
  def setup
    @register = CashRegister.new(10)
    @t1 = Transaction.new(1)
    @t1.amount_paid = 1
    @t2 = Transaction.new(2)
    @t2.amount_paid = 5
  end

  def test_accept_money
    @register.accept_money(@t1)
    assert_equal(11, @register.total_money)
  end
  
  def test_change
    assert_equal(3, @register.change(@t2))
  end

  def test_give_receipt
    assert_output("You've paid $1.\n") { @register.give_receipt(@t1) }
  end

  def test_prompt_for_payment
    input = StringIO.new("1\n")

    capture_io {@t1.prompt_for_payment(input: input)}
    
    assert_equal(1, @t1.amount_paid)
  end
end

