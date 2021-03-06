require 'spec_helper'
require_relative '../lib/card'

describe "Card" do 
  it "should check that card number consist of digets during initialization" do 
    expect { Card.new('abcdfghkmnop') }.to raise_error
  end

  it "should check that card has a proper length" do 
    expect { Card.new('12345678901234567') }.to raise_error
    expect { Card.new('1234567890') }.to raise_error
  end

  it "should determine if card number is valid" do 
    expect(Card.new('4408041234567893').valid?).to be true
  end

  it "should determine if card number is invalid" do 
    expect(Card.new('4417123456789112').valid?).to be false
  end

  it "should correctly determine card type" do 
    expect(Card.new('340000000000009').type).to eq 'AMEX'
    expect(Card.new('4111111111111111').type).to eq 'Visa'
    expect(Card.new('6011000000000004').type).to eq 'Discover'
    expect(Card.new('5500000000000004').type).to eq 'MasterCard'
    expect(Card.new('30000000000004').type).to eq 'Unknown'
  end
end
