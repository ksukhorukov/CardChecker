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
    UNKNOWN_TYPE = 'Unknown'

    ALL_TYPES = %w[amex discover mastercard visa sber]

    def type
      return AMEX_TYPE if is_amex?

      return DISCOVER_TYPE if is_discover?

      return MASTERCARD_TYPE if is_mastercard?

      return VISA_TYPE if is_visa?

      return SBER_TYPE if is_sber?

      return ALFA_TYPE if is_alfa?

      return MIR_TYPE if is_mir?

      UNKNOWN_TYPE
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
      return true if is_unknown? and prefix_of_card_equal? '2200'
    end

    def form_method_type(method_type)
      "is_#{method_type}?"
    end 
  end
end
