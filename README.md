# CARD CHECKER
## INTRO

Validates credit cards according to Luhn algorithm and determines the name of the bank that has issued the card

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
