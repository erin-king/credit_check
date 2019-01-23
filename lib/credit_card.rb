require 'pry'
require './lib/credit_check'


class CreditCard

  attr_reader :card_number,
              :limit

  def initialize(card_number, limit)
    @card_number = card_number
    @limit = limit
  end

  def last_four
    @card_number.slice(-4..-1)
  end

  def is_valid?
    credit_check = CreditCheck.new(@card_number)
    credit_check.validate_card_number
  end

end
