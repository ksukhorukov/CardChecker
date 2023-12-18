require 'pry'

class Cards
  module TypeChecker
    AMEX_TYPE = 'AMEX'
    DISCOVER_TYPE = 'Discover'
    MASTERCARD_TYPE = 'MasterCard'
    VISA_TYPE = 'Visa'
    SBER_TYPE = 'Sber'
    ALFA_TYPE = 'Alfa'
    MIR_TYPE = 'Mir'
    RAIFAIZEN_TYPE = 'Raifaizen'
    KASPI_TYPE = 'Kaspi'
    UNKNOWN_TYPE = 'Unknown'

    RAIFAIZEN_TYPE_PREFIXES = [ '220030' ]

    ALL_TYPES = %w[amex discover mastercard visa sber alfa mir raifaizen kaspi unknown]

    def type
      return AMEX_TYPE if is_amex?

      return DISCOVER_TYPE if is_discover?

      return SBER_TYPE if is_sber?

      return ALFA_TYPE if is_alfa?

      return MIR_TYPE if is_mir?

      return RAIFAIZEN_TYPE if is_raifaizen?

      return KASPI_TYPE if is_kaspi?

      return VISA_TYPE if is_visa?

      return MASTERCARD_TYPE if is_mastercard?

      UNKNOWN_TYPE
    end

    def is_raifaizen?
      card_length_is 16 and raifizen_prefix?
    end

    def raifizen_prefix?
      RAIFAIZEN_TYPE_PREFIXES.map { |prefix| prefix_of_card_equal? prefix }.reduce(:or)  
    end

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

    def is_alfa?
      card_length_is_or 16 and prefix_of_card_equal? '4584'
    end

    def is_unknown?
      ::Cards::TypeChecker::ALL_TYPES.map { |type| send(form_method_type(type)) }.reduce(&:|) != true 
    end 

    def is_mir?
      card_length_is_or 16 and prefix_of_card_equal? '220015'
    end

    def is_kaspi?
      card_length_is_or 16 and prefix_of_card_equal? '440043'
    end

    def form_method_type(method_type)
      "is_#{method_type}?"
    end 
  end
end
