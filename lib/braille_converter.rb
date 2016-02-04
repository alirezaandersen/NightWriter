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

  def braille_to_letter(braille)
    Alphabet.English[braille][TOP]
    alphabet.English[braille][MID]
    alphabet.English[braille][BOT]
  end

  def braille_to_word(braille_word)
    english_word = []
    braille_word.split.each do |letter|
      english_word << braille_to_letter(letter)
    end
    english_word.join
  end

  def braille_to_string(braille_string)
    english_string = []
    braille_string.split.each do |word|
      english_string << braille_to_word(word)
    end
    english_string.insert.join
    require 'pry'; binding.pry
  end

end

# Input > Steps > OUTPUT
# Description/Test = Input and OUTPUT
# Code = Steps
