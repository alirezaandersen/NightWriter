require 'pry'
require_relative 'alphabet'

class BrailleConverter

  include Alphabet

  attr_accessor :braille_word_top, :braille_word_mid, :braille_word_bot


  def initialize

    @braille_word_top = []
    @braille_word_mid = []
    @braille_word_bot = []
  end

  def is_digit?(letter)
    return true if letter =~ /\A\d+\Z/
    true if Float(letter) rescue false
  end

  def get_braille_char(letter,position)
    entire_english_alphabet = Alphabet::English.merge(Alphabet::EnglishNumber)
    return is_digit?(letter) ? entire_english_alphabet["#"][position] + entire_english_alphabet[letter][position] : entire_english_alphabet[letter][position]
  end

  def letter_to_braille(letter)
    {TOP => get_braille_char(letter,TOP),
      MID => get_braille_char(letter,MID),
      BOT => get_braille_char(letter,BOT),}
  end

  def word_to_braille(english_word)
    english_word.chars.each do |char|
      @braille_word_top << letter_to_braille(char)[TOP]
      @braille_word_mid << letter_to_braille(char)[MID]
      @braille_word_bot << letter_to_braille(char)[BOT]
    end
    [@braille_word_top,@braille_word_mid,@braille_word_bot]
  end

  def print_word_to_braille
    lines = braille_wrap
    lines.each{ |top,mid,bot|
      puts top
      puts mid
      puts bot
    }
  end

  def braille_wrap
    lines = []
    if @braille_word_top.join.length < 80
      lines << get_braille_line
    else
      get_braille_lines
    end
  end

  def get_braille_line
    [@braille_word_top.join,@braille_word_mid.join,@braille_word_bot.join]
  end

  def get_braille_lines
    top_line = ''
    mid_line = ''
    bot_line = ''
    total_len = 0
    lines = []
    @braille_word_top.map.with_index{|braille,index|
      total_len += braille.length
      if total_len >80

        lines << array_of_strings(top_line,mid_line,bot_line)
        total_len = 0

        clear_values(top_line,mid_line,bot_line)
      end
      top_line << @braille_word_top[index]
      mid_line << @braille_word_mid[index]
      bot_line << @braille_word_bot[index]
    }
    lines << array_of_strings(top_line,mid_line,bot_line)
  end

  def clear_values *vals
    vals.each{ |val| val.clear }
  end

  def array_of_strings *dupness
    dupness.map{ |dupness| dupness.dup}
  end

end
# Input > Steps > OUTPUT
# Description/Test = Input and OUTPUT
# Code = Steps
# c = BrailleConverter.new
#p c.letter_to_braille('1')  # .0.0000.....


#top => .00.
#mid => .0..
#bot => 00..
