class Cards
  module Helpers
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

    def sum_of_digits(str)
      str.to_s.split('').map(&:to_i).reduce(&:+)
    end

    def is_divisible_by_ten?(n)
      n % 10 == 0
    end

    def reversed_card_number
      card.split('').map(&:to_i).reverse
    end
  end
end
