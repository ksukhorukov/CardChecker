#!/usr/bin/env ruby

require './lib/cards'

def usage
  if ARGV.count != 1 
    puts "
      \nUsage example:\n\n\t#{$0} 5425233430109903\n
      \tValid card. Type: MasterCard\n
      ".colorize(color: :green, mode: :bold) 
    end
  exit
end 

usage if ARGV.count != 1

card = Cards.new(ARGV[0].strip.gsub(/\s+/, ''))

begin 
  if card.valid?
    puts "Valid card. Type: #{card.type}".colorize(color: :green, mode: :bold) 
  else
    puts "Invalid card".colorize(color: :red, mode: :bold) 
  end
rescue => e
  puts "Invalid card".colorize(color: :red, mode: :bold) 
end