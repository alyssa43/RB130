require 'minitest/autorun'
require 'stringio'
# require "minitest/reporters"
# Minitest::Reporters.use!

require_relative 'transaction'
require_relative 'cash_register'

class TransactionTest < Minitest::Test
  def setup
    @register = CashRegister.new(100)
    @transaction = Transaction.new(10)
  end

  def test_prompt_for_payment
    input = StringIO.new('10\n')
    assert_equal(0, @transaction.amount_paid)
    @transaction.prompt_for_payment(input: input)
    assert_equal(10, @transaction.amount_paid)
  end
end