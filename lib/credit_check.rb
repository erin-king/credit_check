# act as runner file?
require 'pry'

class CreditCheck

  attr_reader :card_number

  def initialize(card_number)
    @card_number = card_number
  end

  def split_card_number_to_strings
    @card_number.split(//)
  end

  def double_every_other_digit
    doubled_array = []
    index_counter = 0
    split_card_number_to_strings.each do |number_string|
      if index_counter % 2 == 0
        doubled_array << (number_string.to_i * 2).to_s
      else
        doubled_array << number_string
      end
      index_counter += 1
    end
    doubled_array
  end

  def sum_digits_over_ten
    summed_array = []
    double_every_other_digit.each do |number|
      if number.length == 2
        summed_array << number[0].to_i + number[1].to_i
      else
        summed_array << number.to_i
      end
    end
    summed_array
  end

  def sum_results
    sum = sum_digits_over_ten.sum
  end

  def divisible_by_ten?
    sum_results % 10 == 0
  end

  def validate_card_number
    split_card_number_to_strings
    double_every_other_digit
    sum_digits_over_ten
    sum_results
    divisible_by_ten?
  end

end
