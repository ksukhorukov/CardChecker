require_relative 'bank_types'

class Cards
  include BankTypes

  module TypeChecker

    def type
      return ::BankTypes::AMEX_TYPE if is_amex?

      return ::BankTypes::DISCOVER_TYPE if is_discover?

      return ::BankTypes::SBER_TYPE if is_sber?

      return ::BankTypes::ALFA_TYPE if is_alfa?

      return ::BankTypes::MIR_TYPE if is_mir?

      return ::BankTypes::RAIFAIZEN_TYPE if is_raifaizen?

      return ::BankTypes::KASPI_TYPE if is_kaspi?

      return ::BankTypes::VISA_TYPE if is_visa?

      return ::BankTypes::MASTERCARD_TYPE if is_mastercard?

      return ::BankTypes::TINKOFF_TYPE if is_tinkoff?



      ::BankTypes::UNKNOWN_TYPE
    end

    def is_raifaizen?
      card_length_is 16 and raifizen_prefix?
    end

    def raifizen_prefix?
      ::BankTypes::RAIFAIZEN_TYPE_PREFIXES.map { |prefix| prefix_of_card_equal? prefix }.reduce(:or)  
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

    def is_tinkoff?
      card_length_is_or 16 and prefix_of_card_equal? '220070'
    end 

    def form_method_type(method_type)
      "is_#{method_type}?"
    end 
  end
end
