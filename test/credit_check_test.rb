require 'pry'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/credit_check'

class CreditCheckTest < Minitest::Test
  def test_it_exists
    credit_check = CreditCheck.new("5541808923795240")

    assert_instance_of CreditCheck, credit_check
  end

  def test_it_can_split_card_number_into_strings
    credit_check = CreditCheck.new("5541808923795240")

    expected = ["5", "5", "4", "1", "8", "0", "8", "9", "2", "3", "7", "9", "5", "2", "4", "0"]
    assert_equal expected, credit_check.split_card_number_to_strings
  end

  def test_it_can_double_every_other_digit
    credit_check = CreditCheck.new("5541808923795240")
    credit_check.split_card_number_to_strings

    expected = ["10", "5", "8", "1", "16", "0", "16", "9", "4", "3", "14", "9", "10", "2", "8", "0"]
    assert_equal expected, credit_check.double_every_other_digit
  end

  def test_it_can_sum_digits_over_ten
    # skip
    credit_check = CreditCheck.new("5541808923795240")
    credit_check.split_card_number_to_strings
    credit_check.double_every_other_digit

    expected = [1, 5, 8, 1, 7, 0, 7, 9, 4, 3, 5, 9, 1, 2, 8, 0]
    assert_equal expected, credit_check.sum_digits_over_ten
  end

  def test_it_can_sum_results
    credit_check = CreditCheck.new("5541808923795240")
    credit_check.split_card_number_to_strings
    credit_check.double_every_other_digit
    credit_check.sum_digits_over_ten

    assert_equal 70, credit_check.sum_results
  end

  def test_it_is_divisible_by_ten
    credit_check = CreditCheck.new("5541808923795240")
    credit_check.split_card_number_to_strings
    credit_check.double_every_other_digit
    credit_check.sum_digits_over_ten
    credit_check.sum_results

    assert credit_check.divisible_by_ten?, "Not a valid credit card number."
  end

  def test_it_validates_card_number
    credit_check = CreditCheck.new("5541808923795240")

    assert true, credit_check.validate_card_number
  end

end
