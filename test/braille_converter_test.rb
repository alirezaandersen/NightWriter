require "./lib/braille_converter"
require "minitest/autorun"
require "minitest/pride"


class BrailleConverterTest < Minitest::Test

  def setup
    @brailleconverter = BrailleConverter.new
  end


  def test_Module_accepts_english_character_input
    assert_equal 61, Alphabet::English.keys.length
  end

  def test_translate_single_english_letter_to_braille_letter
    x = [["0."], [".."], [".."]]
    assert_equal x, @brailleconverter.word_to_braille("a")
  end

  def test_translate_single_word_english_to_braille_word
    x = [["0.", "0.", ".0"], ["..", "0.", "0."], ["..", "0.", ".."]]
    assert_equal x, @brailleconverter.word_to_braille("ali")
  end

  def test_translate_english_phrase_to_braille_phrase
    x = [["0.", "0.", "0.", "0.", "0.", "..", ".0", "0.", "0.", "0.", "00"], ["00", ".0", "0.", "0.", ".0", "..", "00", ".0", "00", "0.", ".0"], ["..", "..", "0.", "0.", "0.", "..", ".0", "0.", "0.", "0.", ".."]]
    assert_equal x, @brailleconverter.word_to_braille("hello world")
  end

  def test_translates_braille_space_character_to_english_space

    assert_equal "......", @brailleconverter.word_to_braille(" ").join
  end

  def test_empty_braille_input_should_convert_nothing
    assert_equal '', @brailleconverter.word_to_braille('').join

  end

  def test_translate_braille_lowercase_letter_to_english_lower_case_letter
    assert_equal [["0."], [".."], [".."]], @brailleconverter.word_to_braille("a")
    assert_equal  [["0.", "0."], ["..", "0."], ["..", ".."]], @brailleconverter.word_to_braille("b")
    assert_equal [["0.", "0.", "00"], ["..", "0.", ".."], ["..", "..", ".."]], @brailleconverter.word_to_braille("c")
  end

  def test_braille_translate_capital_letters
    assert_equal [["..0."], ["...."], [".0.."]], @brailleconverter.word_to_braille("A")
    assert_equal  [["..0.", "..0."], ["....", "..0."], [".0..", ".0.."]], @brailleconverter.word_to_braille("B")
    assert_equal [["..0.", "..0.", "..00"], ["....", "..0.", "...."], [".0..", ".0..", ".0.."]], @brailleconverter.word_to_braille("C")
  end

  def test_braille_translate_valid_characters
    assert_equal [[".."], ["00"], ["0."]], @brailleconverter.word_to_braille("!")
    assert_equal  [["..", ".."], ["00", ".."], ["0.", "00"]], @brailleconverter.word_to_braille("-")
    assert_equal [["..", "..", ".."], ["00", "..", "0."], ["0.", "00", "00"]], @brailleconverter.word_to_braille("?")
  end


  def test_translate_english_number_to_braille
    x =[[".000", ".00."], [".0..", ".0.0"], ["00..", "00.."]]
    assert_equal x, @brailleconverter.word_to_braille("35")
  end

  def test_braille_prints_out_in_echo
    @brailleconverter.word_to_braille("A")
    assert_equal ["..0."], @brailleconverter.braille_word_top
    assert_equal ["...."], @brailleconverter.braille_word_mid
    assert_equal [".0.."], @brailleconverter.braille_word_bot
  end

  def test_braille_wraps_after_80_characters
    @brailleconverter.word_to_braille("this project has led me to get more confused about load path of files")
    braille_lines = @brailleconverter.braille_wrap
    assert_equal 80, braille_lines[0][0].length
  end

  def test_mixed_english_numbers_and_characters_to_braille
    @brailleconverter.word_to_braille("123 hello 123")
    assert_equal ".00..00..000..0.0.0.0.0....00..00..000", @brailleconverter.braille_word_top.join
    assert_equal ".0...00..0....00.00.0..0...0...00..0..", @brailleconverter.braille_word_mid.join
    assert_equal "00..00..00........0.0.0...00..00..00..", @brailleconverter.braille_word_bot.join
  end

  def test_consecutive_english_numbers_to_braille_numbers
    @brailleconverter.word_to_braille("123456")
    assert_equal ".00..00..000.000.00..000", @brailleconverter.braille_word_top.join
    assert_equal ".0...00..0...0.0.0.0.00.", @brailleconverter.braille_word_mid.join
    assert_equal "00..00..00..00..00..00..", @brailleconverter.braille_word_bot.join
  end

  def test_capital_english_letters_and_numbers_convert_to_braille
    @brailleconverter.word_to_braille("A1 Steak Sauce")
    assert_equal "..0..00......0.00.0.0......00.0.000.", @brailleconverter.braille_word_top.join
    assert_equal ".....0......0.00.0........0........0", @brailleconverter.braille_word_mid.join
    assert_equal ".0..00.....00.0.....0....00...00....", @brailleconverter.braille_word_bot.join
  end

end
