require_relative './helpers'
require_relative './format_validation'
require_relative './type_checker'
require_relative './cards_validator'

class Cards
  include Helpers
  include FormatValidation
  include TypeChecker
  include CardsValidator

  attr_reader :card, :card_length

  def initialize(number)
    @card, @card_length = number, number&.length

    format_validation
  end
end