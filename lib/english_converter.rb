require 'pry'
require_relative 'alphabet'

class EnglishConverter

  include Alphabet

  def initialize
    @num_lock = false
  end

  def get_braille_chunks(braille)
    braille.scan(/.{1,2}/)
  end

  def chunks_to_braille_strings(top,mid,bot)
    top.zip(mid,bot).map { |el| el.join }
  end

  def braille_to_english(braille_string)
      if @num_lock == true
        Alphabet::BrailleNumber.fetch(braille_string)
      else
        Alphabet::Braille.fetch(braille_string)
      end
  end

  def print_braille_phrases_to_english_phrases(top,mid,bot)
    english_string = braille_phrases_to_english_phrases(top,mid,bot)
    p english_string
  end

  def braille_is_cap?(braille_string)
    return braille_string == BRAILLE_CAP
  end

  def braille_to_cap(braille_string)
    return braille_string.nil? ? nil : BRAILLE_CAP + braille_string
  end

  def braille_is_space?(braille_string)
    (braille_string == BRAILLE_SPACE) && (@num_lock == true)
  end

  def braille_to_num(braill_string)
    return braille_string.nil? ? nil : BRAILLE_NUM + braille_string
  end

  def braille_is_num?(braille_string)
    return braille_string == BRAILLE_NUM
  end

  def is_digit?(braille_string)
    return Alphabet::BrailleNumber.fetch(braille_string,-1).to_i >= 0 && Alphabet::BrailleNumber.fetch(braille_string,10).to_i <= 9
  end

  def braille_phrases_to_english_phrases(top,mid,bot)
    final_string = ''
    output = []
    bs = chunks_to_braille_strings(top,mid,bot)
    # binding.pry
    bs.each.with_index do |string,index|
      next if braille_is_cap?(bs[index-1])
      if (string == BRAILLE_NUM) && is_digit?(bs[index+1])
          @num_lock = true
          next
      end
      @num_lock = false if braille_is_space?(string)

      final_string = (braille_is_cap?string) ? braille_to_cap(bs[index+1]) : string
      output << braille_to_english(final_string) unless final_string.nil?
    end
    output.join
  end

end


# englishconverter = EnglishConverter.new
#
# 
# t= englishconverter.get_braille_chunks("..0.0..0")
# m= englishconverter.get_braille_chunks("....0.0.")
# b= englishconverter.get_braille_chunks(".0..0...")
# p englishconverter.braille_phrases_to_english_phrases(t,m,b)
# #
