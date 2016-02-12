require 'pry'
require_relative 'alphabet'

class EnglishConverter

  include Alphabet

  def initialize
    @num_lock = false
  end

  def get_braille_chunks(braille)
    binding.pry
    braille.gsub!("\\n",'')
    i = 0
    chunk_len = 2
    increment = 2
    chunks = []
    # binding.pry
    (braille.chomp.length/increment).times {
      chunks << braille[i,chunk_len]
      i+=increment
    }
    chunks

  end

  def chunks_to_braille_strings(top,mid,bot)
    top.zip(mid,bot).map { |el| el.join }
  end

  def braille_to_english(braille_string)
      #  Alphabet::Braille.merge(Alphabet::BrailleNumber).fetch(braille_string)
      # binding.pry if braille_string == '.0.000'
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

      if (string == BRAILLE_SPACE) && (@num_lock == true)
          #if num_lock is on, turn it off
          @num_lock = false
      end

      final_string = if braille_is_cap?string
                        braille_to_cap(bs[index+1])
                      else
                          string
                      end

      output << braille_to_english(final_string) unless final_string.nil?

    end
    output.join
  end

end
# englishconverter = EnglishConverter.new
# t= englishconverter.get_braille_chunks("..0.0..0")
# m= englishconverter.get_braille_chunks("....0.0.")
# b= englishconverter.get_braille_chunks(".0..0...")
# p englishconverter.braille_phrases_to_english_phrases(t,m,b)

# t= englishconverter.get_braille_chunks(".0..0.0..0")
# m= englishconverter.get_braille_chunks(".0....0.0.")
# b= englishconverter.get_braille_chunks("00.0..0...")
# p englishconverter.braille_phrases_to_english_phrases(t,m,b)

# t= englishconverter.get_braille_chunks(".00...0..0")
# m= englishconverter.get_braille_chunks(".0....0.0.")
# b= englishconverter.get_braille_chunks("00....0...")
# p englishconverter.braille_phrases_to_english_phrases(t,m,b)

# t= englishconverter.get_braille_chunks(".00.....0..0")
# m= englishconverter.get_braille_chunks(".0......0.0.")
# b= englishconverter.get_braille_chunks("00.....00...")
# p englishconverter.braille_phrases_to_english_phrases(t,m,b)

# t= englishconverter.get_braille_chunks("..0..00.....0..0")
# m= englishconverter.get_braille_chunks(".....0......0.0.")
# b= englishconverter.get_braille_chunks(".0..00.....00...")
# p englishconverter.braille_phrases_to_english_phrases(t,m,b)

# t= englishconverter.get_braille_chunks("..0..00.....0..0")
# m= englishconverter.get_braille_chunks(".....0......0.0.")
# b= englishconverter.get_braille_chunks(".0..00.....00...")
# p englishconverter.braille_phrases_to_english_phrases(t,m,b)
