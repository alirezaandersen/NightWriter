require "braille_converter"
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
    assert_equal "0..... 0.0.0. .00...", brailleconverter.word_to_braille("ali")
  end

  def test_translate_braille_phrases_to_english_phrase
    skip
    brailleconverter = BrailleConverter.new
    assert_equal "cat hat", brailleconverter.braille_to_string("00.... 0..... .0000. 0.00.. 0..... .0000.")
  end
  # Input > Steps > OUTPUT
  # Description/Test = Input and OUTPUT
  # Code = Steps


end
