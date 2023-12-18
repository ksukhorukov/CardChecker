# Card Checker
## Intro

Validates credit cards according to Luhn algorithm and determines the name of the bank that has issued the card

### Requirements

Ruby 3.0.0 or higher

## Supported Types And Banks

* Visa
* Masteracrd
* AMEX
* Discover
* SberBank
* AlfaBank
* MIR
* Raifaizen 

### Install

```
gem install bundler
bundle
chmod +x app.rb
```

### Test

```
bundle exec rspec
```

### Usage

```
% ./app.rb

Usage example:

	./app.rb 5425233430109903
	Valid card. Type: MasterCard

```

Enjoy!

### [EOF]
