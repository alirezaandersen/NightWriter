require 'pry'
require 'colorize'
require_relative 'file_helper'
require_relative 'braille_to_english_converter'


class NightReader#(decryptor)reads translated message


  attr_reader :file_reader


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
    # binding.pry
  #end
  end


end

# Main Code
  # unless ARGV.length ==1
  #   puts "Usage: " + __FILE__ + " <input file>"
  #   exit
  # end
  #
  # #night = NightReader.new(ARGV[0])
  # converter = EnglishConverter.new
  #
  # (top, mid, bot) = File.readlines(ARGV[0])
  # puts top.chomp
  # puts mid.chomp
  # puts bot.chomp
  #
  # t= converter.get_braille_chunks(top)
  # m= converter.get_braille_chunks(mid)
  # b= converter.get_braille_chunks(bot)
  #
  # converter.braille_phrases_to_english_phrases(t,m,b)

  unless ARGV.length >=1 && ARGV.length <= 2
    puts "Usage: " + __FILE__ + " <input file>"
    puts "Usage: " + __FILE__ + " <input file> <output file>"
    exit
  end

  night = NightReader.new(ARGV[0],ARGV[1])
  night.print_english_to_output if ARGV.length == 1
  night.print_english_to_file(ARGV[1]) if ARGV.length == 2
