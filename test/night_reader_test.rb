require "./lib/night_reader"
require "minitest/autorun"
require "minitest/pride"
require 'pry'


class NightReaderTest < Minitest::Test

  def setup
    @infile = "./test/converter_test/braille_input.txt"
    @outfile = "./test/converter_test/english_output.txt"
    @night = NightReader.new(@infile,@outfile)
  end


  def test_message_recieves_input
    assert_equal ["..0.0..0..0.0000....0..00.0....00.00.0..000.0...0...0.0.0.0.0.00..0.0.0000...00.0.0...0.0.0.0.0000...00.0...0.0.0.000....00..00....0.0000..0", "....0.0......0.0.....00.0.....00.0.000..0..000......00.0..0.0..0..0..0.000..00..0.......00.0...0.0..0000.0..0.0..0.......00..0....000....00.", ".0..0.......0......000.........0..0.0.....0.0.......0.....0.0.00..0.0.0......0..0.0.....0.0.000.....0.........0.0...0...00..00....0...0...0."], @night.reader
  end


  def test_new_file_is_written
    system(`which ruby`.chomp, "./lib/reader.rb",@infile,@outfile)
    assert_equal File.read(@outfile).chomp, "Ali and Ziba went for a really long walk around the block 21 times"
  end

  def test_returns_out_going_message_length
    system(`which ruby`.chomp, "./lib/reader.rb",@infile,@outfile)
    assert_equal 66,  File.read(@outfile).chomp.length
  end



end
