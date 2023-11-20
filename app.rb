#!/usr/bin/env ruby

require './lib/cards'

def usage
  puts "
    \nUsage example:\n\n\t#{$0} 5425233430109903\n
    \tValid card. Type: MasterCard\n
    ".colorize(color: :green, mode: :bold) 
  exit
end 

usage if ARGV.count != 1

card_number_striped = ARGV[0].strip

usage if card_number_striped.size != 16

card_number = card_number_striped.gsub(/\s+/, '')

card = Cards.new(card_number)

begin 
  if card.valid?
    puts "Valid card. Type: #{card.type}".colorize(color: :green, mode: :bold) 
  else
    puts "Invalid card".colorize(color: :red, mode: :bold) 
  end
rescue => e
  puts "Invalid card".colorize(color: :red, mode: :bold) 
end