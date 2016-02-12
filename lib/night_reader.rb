require 'pry'
require 'colorize'
require_relative 'file_helper'
require_relative 'english_converter'


class NightReader

  attr_reader :reader

  def initialize(inFile,outFile)
    @reader = FileReader.readlines(inFile)
    @writer = FileWriter.new(outFile)
    @converter = EnglishConverter.new
  end

  def print_english_to_output
    (top, mid, bot) = @reader.map{|line| line.chomp }
     t= @converter.get_braille_chunks(top)
     m= @converter.get_braille_chunks(mid)
     b= @converter.get_braille_chunks(bot)

     @converter.print_braille_phrases_to_english_phrases(t,m,b)
  end

  def print_english_to_file(output_filename)
    (top, mid, bot) = @reader.map{|line| line.chomp }
     t= @converter.get_braille_chunks(top)
     m= @converter.get_braille_chunks(mid)
     b= @converter.get_braille_chunks(bot)

    english_string = @converter.braille_phrases_to_english_phrases(t,m,b)
    @writer.write_line(english_string)
    puts "Created " + output_filename.colorize(:red) + " containing " + english_string.length.to_s + " characters"
  end


end
