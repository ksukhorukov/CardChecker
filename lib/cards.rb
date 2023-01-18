require_relative './helpers'
require_relative './type_checker'
require_relative './cards_validator'
require_relative './format_validation'

class Cards
  include Helpers
  include TypeChecker
  include CardsValidator
  include FormatValidation

  attr_reader :card, :card_length

  def initialize(number)
    @card = number
    @card_length = number&.length

    format_validation
  end
end
