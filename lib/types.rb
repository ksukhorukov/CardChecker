class Cards
  module Types
    AMEX_TYPE = 'AMEX'
    DISCOVER_TYPE = 'Discover'
    MASTERCARD_TYPE = 'MasterCard'
    VISA_TYPE = 'Visa'
    SBER_TYPE = 'Sber'
    UNKNOWN_TYPE = 'Unknown'

    def is_amex?
      card_length_is 15 and (prefix_of_card_equal? '34' or prefix_of_card_equal? '37')
    end

    def is_discover?
      card_length_is 16 and prefix_of_card_equal? '6011'
    end

    def is_mastercard?
      card_length_is 16 and (first_two_card_digits >= 51 and first_two_card_digits <= 55)
    end

    def is_visa?
      card_length_is_or 13, 16 and prefix_of_card_equal? '4'
    end

    def is_sber?
      card_length_is_or 16, 16 and prefix_of_card_equal? '2202'
    end
  end
end
