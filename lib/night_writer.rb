require 'pry'
require_relative 'file_helper'
require_relative 'braille_converter'
require_relative 'night_reader.rb'

class NightWriter#encryptor(reads message and translates it)
  attr_reader :reader, :writer, :converter

  def initialize
    @reader = FileReader.read.chomp
    # p @reader
    #  binding.pry
    @writer = FileWriter.new
    @converter = BrailleConverter.new
  end

  def txt_translation
    # puts "translating english to braille right now"
    @converter.word_to_braille(@reader)
    @converter.print_word_to_braille
  # end
    #takes incoming english message.txt file and translates message through BrailleConverter class

  end

  def translator
    #takes the translated_message.txt and sends it to
  end

end

night = NightWriter.new
night.txt_translation
