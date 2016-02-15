require 'pry'
require_relative 'alphabet'

class BrailleConverter

  include Alphabet

  attr_accessor :braille_word_top, :braille_word_mid, :braille_word_bot


  def initialize

    @braille_word_top = []
    @braille_word_mid = []
    @braille_word_bot = []
  end

  def is_digit?(letter)
    return true if letter =~ /\A\d+\Z/
    true if Float(letter) rescue false
  end

  def get_braille_char(letter,position)
    entire_english_alphabet = Alphabet::English.merge(Alphabet::EnglishNumber)
    return is_digit?(letter) ? entire_english_alphabet["#"][position] + entire_english_alphabet[letter][position] : entire_english_alphabet[letter][position]
  end

  def letter_to_braille(letter)
    {TOP => get_braille_char(letter,TOP),
      MID => get_braille_char(letter,MID),
      BOT => get_braille_char(letter,BOT),}
  end

  def word_to_braille(english_word)
    english_word.chars.each do |char|
      @braille_word_top << letter_to_braille(char)[TOP]
      @braille_word_mid << letter_to_braille(char)[MID]
      @braille_word_bot << letter_to_braille(char)[BOT]
    end
    [@braille_word_top,@braille_word_mid,@braille_word_bot]
  end

  def print_word_to_braille
    braille_wrap.each{ |top,mid,bot| print "%s\n%s\n%s\n" % [top,mid,bot] }
  end

  def braille_wrap
    [@braille_word_top.join.scan(/.{1,80}/), @braille_word_mid.join.scan(/.{1,80}/), @braille_word_bot.join.scan(/.{1,80}/)].transpose
  end

end

# braille_converter = BrailleConverter.new
# braille_converter.word_to_braille("A1 Steak Sauce")
# p braille_converter.print_word_to_braille.join





# Input > Steps > OUTPUT
# Description/Test = Input and OUTPUT
# Code = Steps
# c = BrailleConverter.new
#p c.letter_to_braille('1')  # .0.0000.....


#top => .00.
#mid => .0..
#bot => 00..
