require "./lib/english_converter"
require "minitest/autorun"
require "minitest/pride"


class EnglishConverterTest < Minitest::Test

  def setup
    @englishconverter = EnglishConverter.new
  end

  def test_Module_accepts_braille_input
    assert_equal 61, Alphabet::Braille.keys.length
  end

  def test_converts_braille_character_into_top_mid_bot_array

    x = ["0.", "..", ".."]
    assert_equal x , @englishconverter.get_braille_chunks("0.....")
  end

  def test_translates_single_braille_character_to_english_character

    assert_equal "a" , @englishconverter.braille_to_english("0.....")
  end

  def test_translates_single_capital_braille_character_to_capital_english_character

    assert_equal "A" , @englishconverter.braille_to_english(".....00.....")
  end

  def test_translates_braille_special_character_to_valid_english_character

    assert_equal "!" , @englishconverter.braille_to_english("..000.")
    assert_equal "#" , @englishconverter.braille_to_english(".0.000")
  end

  def test_translates_braille_special_characters_to_valid_english_characters

    t= @englishconverter.get_braille_chunks('...0')
    m= @englishconverter.get_braille_chunks('00.0')
    b= @englishconverter.get_braille_chunks('0.00')
    assert_equal "!#" , @englishconverter.braille_phrases_to_english_phrases(t,m,b)
  end

  def test_translate_braille_space_to_valid_character_space

    assert_equal " " , @englishconverter.braille_to_english("......")
  end

  def test_translate_capital_string

    t= @englishconverter.get_braille_chunks("..0.0..0")
    m= @englishconverter.get_braille_chunks("....0.0.")
    b= @englishconverter.get_braille_chunks(".0..0...")
    assert_equal "Ali" , @englishconverter.braille_phrases_to_english_phrases(t,m,b)
  end

  def test_translate_single_braille_word_to_english_word

    t= @englishconverter.get_braille_chunks("..0.0..0")
    m= @englishconverter.get_braille_chunks("....0.0.")
    b= @englishconverter.get_braille_chunks(".0..0...")
    assert_equal "Ali" , @englishconverter.braille_phrases_to_english_phrases(t,m,b)
  end

  def test_traslates_braille_in_string_to_english_string

    t= @englishconverter.get_braille_chunks("..0.0.0.0.0....00.0.0.00..")
    m= @englishconverter.get_braille_chunks("..00.00.0..0..00.0000..0..")
    b= @englishconverter.get_braille_chunks(".0....0.0.0....00.0.0.....")
    assert_equal "Hello world " , @englishconverter.braille_phrases_to_english_phrases(t,m,b)
  end

  def test_hash_symbol_differentiate_between_Capital_letter_and_number

    t= @englishconverter.get_braille_chunks(".0..0.0..0")
    m= @englishconverter.get_braille_chunks(".0....0.0.")
    b= @englishconverter.get_braille_chunks("00.0..0...")
    assert_equal"#Ali", @englishconverter.braille_phrases_to_english_phrases(t,m,b)
  end

  def test_Braille_number_converts_at_space

    t= @englishconverter.get_braille_chunks(".00.....0..0")
    m= @englishconverter.get_braille_chunks(".0......0.0.")
    b= @englishconverter.get_braille_chunks("00.....00...")
    assert_equal "1 Li", @englishconverter.braille_phrases_to_english_phrases(t,m,b)
  end

  def test_number_converts_back_to_letters_when_space_follows_number

    t= @englishconverter.get_braille_chunks("..0..00.....0..0")
    m= @englishconverter.get_braille_chunks(".....0......0.0.")
    b= @englishconverter.get_braille_chunks(".0..00.....00...")
    assert_equal "A1 Li", @englishconverter.braille_phrases_to_english_phrases(t,m,b)
  end

  def test_capital_letter_and_numbers_work_together

    t= @englishconverter.get_braille_chunks("..0..00.....0..0")
    m= @englishconverter.get_braille_chunks(".....0......0.0.")
    b= @englishconverter.get_braille_chunks(".0..00.....00...")
    assert_equal "A1 Li", @englishconverter.braille_phrases_to_english_phrases(t,m,b)
  end

  def test_capitalize_first_letter_ignores_hash_on_conversion

    t= @englishconverter.get_braille_chunks("..0.0..0")
    m= @englishconverter.get_braille_chunks("....0.0.")
    b= @englishconverter.get_braille_chunks(".0..0...")
    assert_equal "Ali", @englishconverter.braille_phrases_to_english_phrases(t,m,b)
  end

  def test_hash_symbol_works_with_capital

    t= @englishconverter.get_braille_chunks(".0..0.0..0")
    m= @englishconverter.get_braille_chunks(".0....0.0.")
    b= @englishconverter.get_braille_chunks("00.0..0...")
    assert_equal "#Ali", @englishconverter.braille_phrases_to_english_phrases(t,m,b)
  end

  def test_hash_symbol_converts_letter_to_number

    t= @englishconverter.get_braille_chunks(".00...0..0")
    m= @englishconverter.get_braille_chunks(".0....0.0.")
    b= @englishconverter.get_braille_chunks("00....0...")
    assert_equal "1 li", @englishconverter.braille_phrases_to_english_phrases(t,m,b)
  end

  def test_mixed_braille_numbers_and_characters_to_english

    t= @englishconverter.get_braille_chunks(".00..00..000..0.0.0.0.0....00..00..000")
    m= @englishconverter.get_braille_chunks(".0...00..0....00.00.0..0...0...00..0..")
    b= @englishconverter.get_braille_chunks("00..00..00........0.0.0...00..00..00..")
    assert_equal "123 hello 123", @englishconverter.braille_phrases_to_english_phrases(t,m,b)
  end

  def test_consecutive_braille_numbers_to_english_numbers

    t=@englishconverter.get_braille_chunks(".00..00..000.000.00..000")
    m=@englishconverter.get_braille_chunks(".0...00..0...0.0.0.0.00.")
    b=@englishconverter.get_braille_chunks("00..00..00..00..00..00..")
    assert_equal "123456", @englishconverter.braille_phrases_to_english_phrases(t,m,b)
  end

  def test_capital_braille_letters_and_numbers_convert_to_english

    t= @englishconverter.get_braille_chunks("..0..00......0.00.0.0......00.0.000.")
    m= @englishconverter.get_braille_chunks(".....0......0.00.0........0........0")
    b= @englishconverter.get_braille_chunks(".0..00.....00.0.....0....00...00....")
    assert_equal "A1 Steak Sauce", @englishconverter.braille_phrases_to_english_phrases(t,m,b)

  end



end
