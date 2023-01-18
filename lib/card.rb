#!/usr/bin/env ruby

class Card
  attr_reader :card, :card_length

  ERROR_INVALID_CARD_FORMAT = 'Card number must consists of digits'
  ERROR_INVALID_CARD_LENGTH = 'Length of a card must be between 13 and 16'

  def initialize(number)
    @card, @card_length = number, number&.length

    validation
  end

  def type
    return 'AMEX' if card_length == 15 and (card[0..1] == '34' or card[0..1] == '37')
     
    return 'Discover' if card_length == 16 and card[0..3] == '6011'
      
    return 'MasterCard' if card_length == 16 and (card[0..1].to_i >= 51 and card[0..1].to_i <= 55)
      
    return 'Visa' if [13, 16].include?(card_length) and card[0] == '4'
      
    'Unknown'
  end

  def valid?
    summ = 0
    @card.split('').map(&:to_i).reverse.each_with_index do |n, i|
      if (i + 1).even?
        n *= 2
        n = n.to_s.split('').map(&:to_i).reduce(&:+) if n > 9
      end
      summ += n
    end
    summ % 10 == 0
  end

  private 

  def validation 
    raise ERROR_INVALID_CARD_FORMAT unless card_number_consists_of_digits?
    raise ERROR_INVALID_CARD_LENGTH if card_length_acceptable?
  end 

  def card_number_consists_of_digits?
    card.match('^\d+$')
  end 

  def card_length_acceptable?
    card_length < 13 or card_length > 16
  end 
end