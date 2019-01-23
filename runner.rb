require './lib/bank'
require './lib/credit_card'
require './lib/credit_check'

puts "Enter credit card number. > "

card_number = gets.chomp
user_credit_card = CreditCard.new(card_number, 500)

if user_credit_card.is_valid?
  puts "The number #{card_number} is valid!"
else
  puts "The number #{card_number} is invalid!"
end

# Valid: 5541808923795240, 4024007136512380, 6011797668867828
# Invalid: 5541801923795240, 4024007106512380, 6011797668868728
