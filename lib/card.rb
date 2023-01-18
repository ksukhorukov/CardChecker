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
    return 'AMEX' if card_length_is 15 and (prefix_of_card_equal? '34' or prefix_of_card_equal? '37')
     
    return 'Discover' if card_length_is 16 and prefix_of_card_equal? '6011'
      
    return 'MasterCard' if card_length_is 16 and (first_two_card_digits >= 51 and first_two_card_digits <= 55)
      
    return 'Visa' if card_length_is_or 13, 16 and prefix_of_card_equal? '4'
      
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

  def prefix_of_card_equal?(str)
    card[0..str.length - 1] == str&.to_s
  end 

  def first_two_card_digits
    card[0..1].to_i
  end 

  def card_length_is(n)
    card_length == n
  end 

  def card_length_is_or(n, m)
    [n, m].include?(card_length)
  end 
end