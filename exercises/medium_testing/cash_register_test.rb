require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require_relative 'cash_register'
require_relative 'transaction'


class CashRegisterTest < Minitest::Test 
  def setup
    @register = CashRegister.new(100)
    @transaction = Transaction.new(10)
  end

  def test_accept_money
    @transaction.amount_paid = 10
    previous_amount = @register.total_money
    @register.accept_money(@transaction)
    current_amount = @register.total_money

    assert_equal(previous_amount + 10, current_amount)
  end

  def test_change
    @transaction.amount_paid = 20

    assert_equal(10, @register.change(@transaction))
  end

  def test_receipt_output
    assert_output("You've paid $#{@transaction.item_cost}.\n") do
     @register.give_receipt(@transaction)
    end
  end  
end
