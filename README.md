# CARD CHECKER
## INTRO

Performs a debit or a credit card number validitation in accordance with the Luhn algorithm. Also if it's possible, determines the name of the bank that has been issued the card.

## REQUIREMENTS

Ruby 3.*

## SUPPORTED BANKS

* Visa
* Masteracrd
* SberBank
* AlfaBank
* Raifaizen 
* Kaspi
* Tinkoff
* MIR
* AMEX
* Discover


## INSTALLATION

```
gem install bundler
bundle
chmod +x app.rb
```

## TESTING

```
bundle exec rspec
```

## USAGE

```
% ./app.rb

Usage example:

	./app.rb 5425233430109903
	Valid card. Type: MasterCard

```

Enjoy!

## [EOF]
