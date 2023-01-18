class Cards
  module FormatValidation
    ERROR_INVALID_CARD_FORMAT = 'Card number must consists of digits'
    ERROR_INVALID_CARD_LENGTH = 'Length of a card must be between 13 and 16'

    def format_validation
      raise ERROR_INVALID_CARD_FORMAT unless card_number_consists_of_digits?
      raise ERROR_INVALID_CARD_LENGTH if card_length_acceptable?
    end
  end
end
