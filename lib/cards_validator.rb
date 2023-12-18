class Cards
  module CardsValidator
    def valid?
      summ = 0

      reversed_card_number.each_with_index do |n, i|
        if (i + 1).even?
          n *= 2
          n = sum_of_digits n if n > 9
        end

        summ += n
      end

      is_divisible_by_ten? summ
    end
  end
end
