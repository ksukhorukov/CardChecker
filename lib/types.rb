require_relative 'bank_types'
require_relative 'type_checker'

class Cards
  include BankTypes
  include TypeChecker
end
