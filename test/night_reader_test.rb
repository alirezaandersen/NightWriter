require_relative "../lib/night_reader"
require "minitest/autorun"
require "minitest/pride"
require 'pry'


class NightReaderTest < Minitest::Test

  def setup
    @infile = "incoming_braille.txt"
    @outfile = "output_english.txt"
    @night = NightReader.new(@infile,@outfile)
  end


  def test_message_recieves_input
    assert_equal ["..0.0..0..0.0000....0..00.0....00.00.0..000.0...0....00.0.0.\n", "....0.0......0.0.....00.0.....00.0.000..0..000......00..0...\n", ".0..0.......0......000.........0..0.0.....0.0........0..0.0.\n"], @night.reader
  end


  def test_new_file_is_written
    system(`which ruby`.chomp, "./lib/reader.rb",@infile,@outfile)
    assert_equal File.read(@outfile).chomp, "Ali and Ziba went for a walk"
  end

  def test_returns_out_going_message_length
    system(`which ruby`.chomp, "./lib/reader.rb",@infile,@outfile)
    assert_equal 28,  File.read(@outfile).chomp.length
  end



end