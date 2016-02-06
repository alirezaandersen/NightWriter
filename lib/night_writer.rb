#!/usr/bin/env ruby

require 'pry'
require_relative 'file_helper'
require_relative 'english_to_braille_converter'

class NightWriter#encryptor(reads message and translates it)
  attr_reader :reader, :writer, :converter

  def initialize(inFile,outFile)
    @reader = FileReader.read(inFile).chomp
    @writer = FileWriter.new(outFile)
    @converter = BrailleConverter.new
  end

  def print_braille_to_output
    @converter.word_to_braille(@reader)
    @converter.print_word_to_braille
  end

  def print_braille_to_file
    @converter.word_to_braille(@reader)
    lines = @converter.braille_wrap
    @writer.write_lines(lines)
  #end
end
end

# Main Code
  unless ARGV.length >=1 && ARGV.length <= 2
    puts "Usage: " + __FILE__ + " <input file>"
    puts "Usage: " + __FILE__ + " <input file> <output file>"
    exit
  end

  night = NightWriter.new(ARGV[0],ARGV[1])
  night.print_braille_to_output if ARGV.length == 1
  night.print_braille_to_file if ARGV.length == 2
