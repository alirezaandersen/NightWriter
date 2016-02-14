#!/usr/bin/env ruby
require_relative "../lib/night_writer"

unless ARGV.length >=1 && ARGV.length <= 2
  puts "Usage: " + __FILE__ + " <input file>"
  puts "Usage: " + __FILE__ + " <input file> <output file>"
  exit
end

input_filename = ARGV[0]
output_filename = ARGV[1]

night = NightWriter.new(ARGV[0],ARGV[1])
night.print_braille_to_output if ARGV.length == 1
if ARGV.length == 2
  night.print_braille_to_file(ARGV[1])
  puts "Created " + output_filename.colorize(:red) + " containing " + File.read(input_filename).gsub("\n","").length.to_s + " characters"
end

#to call from terminal# ./lib/writer.rb ./test/converter_test/english_input.txt ./test/converter_test/braille_output.txt
