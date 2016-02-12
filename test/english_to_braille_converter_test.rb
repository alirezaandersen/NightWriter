require "./lib/braille_converter"
require "minitest/autorun"
require "minitest/pride"


class BrailleConverterTest < Minitest::Test

  def test_Module_accepts_english_character_input
    brailleconverter = BrailleConverter.new
    assert_equal 61, Alphabet::English.keys.length
  end


  def test_translate_single_english_letter_to_braille_letter
    skip
    brailleconverter = BrailleConverter.new
    x = [["0."], [".."], [".."]]
    assert_equal x, brailleconverter.word_to_braille("a")
  end

  def test_translate_single_word_english_to_braille_word
    skip
    brailleconverter = BrailleConverter.new
    x = [["0.", "0.", ".0"], ["..", "0.", "0."], ["..", "0.", ".."]]
    assert_equal x, brailleconverter.word_to_braille("ali")
  end

  def test_translate_english_phrase_to_braille_phrase
    skip
    brailleconverter = BrailleConverter.new
    x = [["0.", "0.", "0.", "0.", "0.", "..", ".0", "0.", "0.", "0.", "00"], ["00", ".0", "0.", "0.", ".0", "..", "00", ".0", "00", "0.", ".0"], ["..", "..", "0.", "0.", "0.", "..", ".0", "0.", "0.", "0.", ".."]]
    assert_equal x, brailleconverter.word_to_braille("hello world")
  end

  def test_translates_braille_space_character_to_english_space
    skip
    brailleconverter = BrailleConverter.new
    assert_equal "......", brailleconverter.word_to_braille(" ").join
  end

  def test_translate_braille_lowercase_letter_to_english_lower_case_letter
    skip
  brailleconverter = BrailleConverter.new
  assert_equal [["0."], [".."], [".."]], brailleconverter.word_to_braille("a")
  assert_equal  [["0.", "0."], ["..", "0."], ["..", ".."]], brailleconverter.word_to_braille("b")
  assert_equal [["0.", "0.", "00"], ["..", "0.", ".."], ["..", "..", ".."]], brailleconverter.word_to_braille("c")
  end

  def test_braille_translate_capital_letters
    skip
    brailleconverter = BrailleConverter.new
    assert_equal [["..0."], ["...."], [".0.."]], brailleconverter.word_to_braille("A")
    assert_equal  [["..0.", "..0."], ["....", "..0."], [".0..", ".0.."]], brailleconverter.word_to_braille("B")
    assert_equal [["..0.", "..0.", "..00"], ["....", "..0.", "...."], [".0..", ".0..", ".0.."]], brailleconverter.word_to_braille("C")
  end

  def test_braille_translate_valid_characters
    skip
    brailleconverter = BrailleConverter.new
    assert_equal [[".."], ["00"], ["0."]], brailleconverter.word_to_braille("!")
    assert_equal  [["..", ".."], ["00", ".."], ["0.", "00"]], brailleconverter.word_to_braille("-")
    assert_equal [["..", "..", ".."], ["00", "..", "0."], ["0.", "00", "00"]], brailleconverter.word_to_braille("?")
  end


  def test_translate_english_number_to_braille
    skip
    brailleconverter = BrailleConverter.new
    x =[["00", "0."], ["..", ".0"], ["..", ".."]]
    assert_equal x, brailleconverter.word_to_braille("35")
  end

  def test_braille_prints_out_in_echo
    skip
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

  def test_braille_inputs_array_of_strings
    skip
    brailleconverter = BrailleConverter.new
    brailleconverter.word_to_braille("Broncos Win!")
    assert_equal [], brailleconverter.array_of_strings
  end



end
# Input > Steps > OUTPUT
# Description/Test = Input and OUTPUT
# Code = Steps
