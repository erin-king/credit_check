require 'pry'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/credit_card'
require './lib/credit_check'


class CreditCardTest < Minitest::Test

  def test_it_exists
    credit_card = CreditCard.new("5541808923795240", 15000)

    assert_instance_of CreditCard, credit_card
  end

  def test_it_has_attributes
    credit_card = CreditCard.new("5541808923795240", 15000)

    assert_equal "5541808923795240", credit_card.card_number
    assert_equal 15000, credit_card.limit
  end

  def test_it_can_get_last_four_digits_of_card_number
    credit_card = CreditCard.new("5541808923795240", 15000)

    assert_equal "5240", credit_card.last_four
  end

  def test_it_is_valid
    credit_card = CreditCard.new("5541808923795240", 15000)
    credit_check = CreditCheck.new("5541808923795240")

    credit_check.validate_card_number

    assert credit_card.is_valid?, "Invalid credit card."
  end
end
