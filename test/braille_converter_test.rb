require "braille_converter"
require "minitest/autorun"
require "minitest/pride"


class BrailleConverterTest < Minitest::Test

  def test_translate_single_braille_character_to_letter
    brailleconverter = BrailleConverter.new
    assert_equal "a", brailleconverter.braille_to_letter("0.....")
  end

  def test_translate_single_braille_word_to_english_word
    brailleconverter = BrailleConverter.new
    assert_equal "ali", brailleconverter.braille_to_word("0..... 0.0.0. .00...")
  end

  def test_translate_braille_phrases_to_english_phrase
    brailleconverter = BrailleConverter.new
    assert_equal "cat hat", brailleconverter.braille_to_string("00.... 0..... .0000. 0.00.. 0..... .0000.")
  end
  # Input > Steps > OUTPUT
  # Description/Test = Input and OUTPUT
  # Code = Steps


end
