#!/usr/bin/env ruby

require './lib/cards'

while(true) do 
  print "Card number: "
  number = gets.strip.gsub(/\s+/, '')
  card = Cards.new(number)
  if card.valid?
    puts "Valid card. Type: #{card.type}"
  else
    puts "Invalid card."
  end
end
