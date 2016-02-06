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
      x =
      num =
      assert_equal num, brailleconverter.word_to_braille("35")
    end
    # Input > Steps > OUTPUT
    # Description/Test = Input and OUTPUT
    # Code = Steps


  end
