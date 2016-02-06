require 'pry'
require_relative 'file_helper'
require_relative 'braille_to_english_converter'


class NightReader#(decryptor)reads translated message


  attr_reader :file_reader

  def initialize
    @reader = FileReader.new
  end


end


# def get_braille_chunks(braille)
#   i = 0
#   chunk_len = 2
#   increment = 2
#   chunks = []
#
#   (braille.chomp.length/increment).times {
#     chunks << braille[i,chunk_len]
#     i+=increment
#   }
#   chunks
# end
#
# def chunks_to_braille_strings(top,mid,bot)
#   top.zip(mid,bot).map { |el|
#     el.join
#   }
# end

# Main Code
  unless ARGV.length ==1
    puts "Usage: " + __FILE__ + " <input file>"
    exit
  end

  #night = NightReader.new(ARGV[0])
  converter = EnglishConverter.new

  (top, mid, bot) = File.readlines(ARGV[0])
  puts top.chomp
  puts mid.chomp
  puts bot.chomp

  t= converter.get_braille_chunks(top)
  m= converter.get_braille_chunks(mid)
  b= converter.get_braille_chunks(bot)

  converter.braille_phrases_to_english_phrases(t,m,b)
=begin
  bs = converter.chunks_to_braille_strings(t,m,b)

  bs.each do |string|
    p Alphabet::Braille.fetch(string)
  end
=end
=begin
t=["..", "0.", "0.", "0.", "0.", "0.", "..", "..", ".0", "0.", "0.", "0.", "00"]
m=["..", "00", ".0", "0.", "0.", ".0", "..", "..", "00", ".0", "00", "0.", ".0"]
b=[".0", "..", "..", "0.", "0.", "0.", "..", ".0", ".0", "0.", "0.", "0.", ".."]

r=[".....0","0.00.."]

=end
