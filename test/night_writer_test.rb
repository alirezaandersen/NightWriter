require_relative "../lib/night_writer"
require "minitest/autorun"
require "minitest/pride"
require 'pry'


class NightWriterTest < Minitest::Test

  def setup
    @infile = "incoming_message.txt"
    @outfile = "output_braille.txt"
    @night = NightWriter.new(@infile,@outfile)
  end


  def test_message_recieves_input
    assert_equal "Ali and Ziba went for a walk", @night.reader
  end


  def test_new_file_is_written
    system(`which ruby`.chomp, "./lib/writer.rb",@infile,@outfile)
    assert_equal File.readlines(@outfile),["..0.0..0..0.0000....0..00.0....00.00.0..000.0...0....00.0.0.\n", "....0.0......0.0.....00.0.....00.0.000..0..000......00..0...\n", ".0..0.......0......000.........0..0.0.....0.0........0..0.0.\n"]
  end

  def test_returns_out_going_message_length
    system(`which ruby`.chomp, "./lib/reader.rb",@infile,@outfile)
    assert_equal 182,  File.read(@outfile).chomp.length
  end



end
