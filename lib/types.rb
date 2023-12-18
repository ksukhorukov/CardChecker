class Cards
  module Types
    AMEX_TYPE = 'AMEX'
    DISCOVER_TYPE = 'Discover'
    MASTERCARD_TYPE = 'MasterCard'
    VISA_TYPE = 'Visa'
    SBER_TYPE = 'Sber'
    MIR_TYPE = 'Mir'
    RAIFAIZEN_TYPE = 'Raifaizen'
    KASPI_TYPE = 'Kaspi Bank'
    UNKNOWN_TYPE = 'Unknown'
    
    RAIFAIZEN_TYPE_PREFIXES = [ '220030' ]

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
      card_length_is_or 16 and prefix_of_card_equal? '2202'
    end

    def is_mir?
      card_length_is_or 16 and prefix_of_card_equal? '220015'
    end

    def is_raifaizen?
      card_length_is 16 and raifizen_prefix?
    end

    def raifizen_prefix?
      RAIFAIZEN_TYPE_PREFIXES.map { |prefix| prefix_of_card_equal? prefix }.reduce(:or)  
    end

    def kaspi?
      card_length_is_or 16 and prefix_of_card_equal? '440043'
    end 
  end
end
