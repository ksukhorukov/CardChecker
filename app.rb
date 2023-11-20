#!/usr/bin/env ruby

require './lib/cards'

def usage
  puts "\nUsage example:\n\n\t#{$0} 5425233430109903\n\tValid card. Type: MasterCard\n\n" if ARGV.count != 1 
  exit
end 

usage if ARGV.count != 1

card = Cards.new(ARGV[0].strip.gsub(/\s+/, ''))

if card.valid?
  puts "Valid card. Type: #{card.type}"
else
  puts "Invalid card."
end