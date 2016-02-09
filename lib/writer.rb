#!/usr/bin/env ruby
require_relative "../lib/night_writer"

unless ARGV.length >=1 && ARGV.length <= 2
  puts "Usage: " + __FILE__ + " <input file>"
  puts "Usage: " + __FILE__ + " <input file> <output file>"
  exit
end

night = NightWriter.new(ARGV[0],ARGV[1])
night.print_braille_to_output if ARGV.length == 1
night.print_braille_to_file(ARGV[1]) if ARGV.length == 2


#to call from terminal# ruby ./lib/writer.rb output_english.txt
