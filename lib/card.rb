class Card
  
  attr_reader :card

  def initialize(number)

    unless number.match('^\d+$')
      raise 'Card number must consists of digets'
    end

    if number.length < 13 or number.length > 16
      raise 'Length of a card must be between 13 and 16'
    end

    @card = number

  end

  def type
    card_length = @card.length
    if card_length == 15 and (@card[0..1] == '34' or @card[0..1] == '37')
      'AMEX'
    elsif card_length == 16 and @card[0..3] == '6011'
      'Discover'
    elsif  card_length == 16 and (@card[0..1].to_i >= 51 and @card[0..1].to_i <= 55)
      'MasterCard'
    elsif (card_length == 13 or card_length == 16) and @card[0] == '4'
      'Visa'
    else
      'Unknown'
    end
  end

  def valid?
    summ = 0
    @card.split('').map(&:to_i).reverse.each_with_index do |n, i|
      if (i+1).even?
        n *= 2
        n = n.to_s.split('').map(&:to_i).reduce(&:+) if n > 9
      end
      summ += n 
    end 
    if summ % 10 == 0
      true
    else
      false
    end
  end

end