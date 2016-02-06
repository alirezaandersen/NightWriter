require 'pry'
require_relative 'file_helper'
require_relative 'braille_converter'
require_relative 'night_reader.rb'

class NightWriter#encryptor(reads message and translates it)
  attr_reader :reader, :writer, :converter

  def initialize(inFile,outFile)
    @reader = FileReader.read(inFile).chomp
    # p @reader
    #  binding.pry
    @writer = FileWriter.new(outFile)
    @converter = BrailleConverter.new
  end

  def txt_translation
    # puts "translating english to braille right now"
    @converter.word_to_braille(@reader)
    @converter.print_word_to_braille
    # end
    #takes incoming english message.txt file and translates message through BrailleConverter class
  end

  def print_braille_to_file
    @converter.word_to_braille(@reader)
    lines = @converter.braille_wrap
    #lines.each{ |top,mid,bot|
    @writer.write_lines(lines)
  #end
end
end

  # if __FILE__ == $0
  #   night_writer = NightWriter.new
  #   # night_writer.print_braille_to_file
  # end

  infile = ARGV[0]
  outfile = ARGV[1]

  p infile
  p outfile

  night = NightWriter.new(infile,outfile)
  #night.txt_translation
  night.print_braille_to_file
