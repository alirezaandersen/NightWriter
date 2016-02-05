require 'pry'
require_relative 'alphabet'


class BrailleConverter

  attr_accessor :braille_word_top, :braille_word_mid, :braille_word_bot

  include Alphabet

  def initialize
    @braille_word_top = []
    @braille_word_mid = []
    @braille_word_bot = []
  end

  def letter_to_braille(letter)
    entire_english_alphabet = Alphabet::English.merge(Alphabet::EnglishNumber)
    {TOP => entire_english_alphabet[letter][TOP],
      MID => entire_english_alphabet[letter][MID],
      BOT => entire_english_alphabet[letter][BOT]}
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
      top_line = ''
      mid_line = ''
      bot_line = ''
      total_len = 0
      lines = []
      if @braille_word_top.join.length <= 80
        lines << [@braille_word_top.join,@braille_word_mid.join,@braille_word_bot.join]
      else
        @braille_word_top.each.with_index{|braille,index|
          total_len += braille.length
          if total_len >=80

            lines << [top_line.dup,mid_line.dup,bot_line.dup]
            top_line.clear
            mid_line.clear
            bot_line.clear
            total_len = 0
          end

          top_line << @braille_word_top[index]
          mid_line << @braille_word_mid[index]
          bot_line << @braille_word_mid[index]
        }
        lines << [top_line.dup,mid_line.dup,bot_line.dup]
      end
      lines
    end

    def print_line(braille_word)

    end

    def word_to_braille2(english_words)
      braille_word = []
      english_word.chars.each do |braille|
        braille_word << letter_to_braille(braille)
      end
      braille_word
      # binding.pry
    end
  end
  # Input > Steps > OUTPUT
  # Description/Test = Input and OUTPUT
  # Code = Steps
  #
  # runner = BrailleConverter.new
  # runner.word_to_braille("hello world!")
  # puts
  #
  # runner.print_word_to_braille
