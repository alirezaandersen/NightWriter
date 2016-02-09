#!/usr/bin/env ruby
require_relative "night_reader"

unless ARGV.length >=1 && ARGV.length <= 2
  puts "Usage: " + __FILE__ + " <input file>"
  puts "Usage: " + __FILE__ + " <input file> <output file>"
  raise ArgumentError, "invalid number of arguments"
end

night = NightReader.new(ARGV[0],ARGV[1])
night.print_english_to_output if ARGV.length == 1
night.print_english_to_file(ARGV[1]) if ARGV.length == 2


#to call from terminal# ruby ./lib/reader.rb braille.txt
