require 'pry'
require_relative 'alphabet'


class EnglishConverter

  def get_braille_chunks(braille)
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
    top.zip(mid,bot).map { |el|
      el.join
    }
  end

  def braille_to_english(braille_string)
      #  Alphabet::Braille.merge(Alphabet::BrailleNumber).fetch(braille_string)
       Alphabet::Braille.fetch(braille_string)
  end

  def print_braille_phrases_to_english_phrases(top,mid,bot)
    english_string = braille_phrases_to_english_phrases(top,mid,bot)

    p english_string
  end


  def braille_phrases_to_english_phrases(top,mid,bot)
    cap = 0
    final_string = ''
    output = []
    bs = chunks_to_braille_strings(top,mid,bot)
    bs.each do |string|
      if string == '.....0'
        cap = 1
        next
      end
      if cap == 1
        final_string = '.....0' + string
        cap = 0
      else
        final_string = string
      end
      output <<  braille_to_english(final_string)
    end
    output.join
  end
end
