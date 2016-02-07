require_relative "../lib/english_to_braille_converter"
require "minitest/autorun"
require "minitest/pride"


class BrailleConverterTest < Minitest::Test

  def test_translate_single_letter_to_braille_character
    brailleconverter = BrailleConverter.new
    x = {0=>"0.", 1=>"..", 2=>".."}
    assert_equal x , brailleconverter.letter_to_braille("a")
  end

  def test_translate_single_braille_word_to_english_word

    brailleconverter = BrailleConverter.new
    x = [["0.", "0.", ".0"], ["..", "0.", "0."], ["..", "0.", ".."]]
    assert_equal x, brailleconverter.word_to_braille("ali")
  end

  def test_translate_english_phrase_to_braille_phrase

    brailleconverter = BrailleConverter.new
    x = [["0.", "0.", "0.", "0.", "0.", "..", ".0", "0.", "0.", "0.", "00"], ["00", ".0", "0.", "0.", ".0", "..", "00", ".0", "00", "0.", ".0"], ["..", "..", "0.", "0.", "0.", "..", ".0", "0.", "0.", "0.", ".."]]
    assert_equal x, brailleconverter.word_to_braille("hello world")
  end

  def test_translate_english_number_to_braille
    brailleconverter = BrailleConverter.new
    x =[["00", "0."], ["..", ".0"], ["..", ".."]]
    assert_equal x, brailleconverter.word_to_braille("35")
  end

  def test_braille_prints_out_in_echo
    brailleconverter = BrailleConverter.new
    brailleconverter.word_to_braille("A")
    assert_equal ["..0."], brailleconverter.braille_word_top
    assert_equal ["...."], brailleconverter.braille_word_mid
    assert_equal [".0.."], brailleconverter.braille_word_bot
  end

  def test_braille_wraps_after_80_characters
    skip
    brailleconverter = BrailleConverter.new
    brailleconverter.word_to_braille("this project has led me to get more confused about load path of files")
    braille_lines = brailleconverter.get_braille_lines
    assert_equal 80, braille_lines[0][0].length
  end

end
# Input > Steps > OUTPUT
# Description/Test = Input and OUTPUT
# Code = Steps
