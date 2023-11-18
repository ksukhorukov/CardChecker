require 'spec_helper'
require_relative '../lib/cards'

describe "Cards" do 
  it "should check that card number consist of digets during initialization" do 
    expect { Cards.new('abcdfghkmnop') }.to raise_error
  end

  it "should check that card has a proper length" do 
    expect { Cards.new('12345678901234567') }.to raise_error
    expect { Cards.new('1234567890') }.to raise_error
  end

  it "should determine if card number is valid" do 
    expect(Cards.new('4408041234567893').valid?).to be true
  end

  it "should determine if card number is invalid" do 
    expect(Cards.new('4417123456789112').valid?).to be false
  end

  it "should correctly determine card type" do 
    expect(Cards.new('340000000000009').type).to eq 'AMEX'
    expect(Cards.new('4111111111111111').type).to eq 'Visa'
    expect(Cards.new('6011000000000004').type).to eq 'Discover'
    expect(Cards.new('5500000000000004').type).to eq 'MasterCard'
    expect(Cards.new('2202206814321472').type).to eq 'Sber'
    expect(Cards.new('30000000000004').type).to eq 'Unknown'
  end
end
