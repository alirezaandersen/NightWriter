require 'pry'
require_relative 'alphabet'


class BrailleConverter

include Alphabet
  # attr_reader :alphabet
  #
  # def initialize
  #   @alphabet = {
  #     "0.","..",".." => "a",
  #     "0.0..." => "b",
  #     "00...." => "c",
  #     "00.0.." => "d",
  #     "0..0.." => "e",
  #     "000..." => "f",
  #     "0000.." => "g",
  #     "0.00.." => "h",
  #     ".00..." => "i",
  #     ".000.." => "j",
  #     "0...0." => "k",
  #     "0.0.0." => "l",
  #     "00..0." => "m",
  #     "00.0.0" => "n",
  #     "0..00." => "o",
  #     "000.0." => "p",
  #     "00000." => "q",
  #     "0.000." => "r",
  #     ".00.0." => "s",
  #     ".0000." => "t",
  #     "0...00" => "u",
  #     "0.0.00" => "v",
  #     ".000.0" => "w",
  #     "00..00" => "x",
  #     "00.000" => "y",
  #     "0..000" => "z"
  #   }
  # end

  def letter_to_braille(letter)
    {TOP => Alphabet::English[letter][TOP],
     MID => Alphabet::English[letter][MID],
     BOT => Alphabet::English[letter][BOT]}
end

  def word_to_braille(english_word)
    braille_word = []
    english_word.split.each do |braille|
      braille_word << letter_to_braille(braille)
    end
    braille_word.join
  end
  #
  # def braille_to_string(english_string)
  #   braille_string = []
  #   english_string.split.each do |braille|
  #     braille_string << word_to_braille(braille)
  #   end
  #   braille_string.insert.join
  #   require 'pry'; binding.pry
  # end

end
# Input > Steps > OUTPUT
# Description/Test = Input and OUTPUT
# Code = Steps
