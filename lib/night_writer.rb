require 'colorize'
require 'pry'
require_relative 'file_helper'
require_relative 'braille_converter'

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

  def print_braille_to_file(output_filename)
    @converter.word_to_braille(@reader)
    lines = @converter.braille_wrap
    @writer.write_lines(lines)
  end
end
