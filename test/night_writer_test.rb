require "./lib/night_writer"
require "./lib/file_helper"
require "minitest/autorun"
require "minitest/pride"
require 'pry'


class NightWriterTest < Minitest::Test

  def setup
    @infile = "./test/converter_test/english_input.txt"
    @outfile = "./test/converter_test/braille_output.txt"
    @night = NightWriter.new(@infile,@outfile)
  end
# ruby ./lib/writer.rb ./test/converter_test/english_input.txt ./test/converter_test/braille_output.txt
  def test_message_recieves_input
    assert_equal "Ali and Ziba went for a really long walk around the block 21 times", FileReader.read(@infile).chomp
  end

  def test_translates_english_to_braille
    `rm #{@outfile}` if File.exists?@outfile
    system(`which ruby`.chomp, "./lib/writer.rb",@infile,@outfile)
    assert_equal ["..0.0..0..0.0000....0..00.0....00.00.0..000.0...0...0.0.0.0.0.00..0.0.0000...00.0.0...0.0.0.0.0000...00.0...0.0.0.000....00..00....0.0000..0", "....0.0......0.0.....00.0.....00.0.000..0..000......00.0..0.0..0..0..0.000..00..0.......00.0...0.0..0000.0..0.0..0.......00..0....000....00.", ".0..0.......0......000.........0..0.0.....0.0.......0.....0.0.00..0.0.0......0..0.0.....0.0.000.....0.........0.0...0...00..00....0...0...0."], FileReader.readlines(@outfile)
 end

  def test_returns_out_going_message_length
    system(`which ruby`.chomp, "./lib/writer.rb",@infile,@outfile)
    assert_equal 66,  File.read(@infile).chomp.length
  end

  def test_recieves_incoming_inputs_message_length
    system(`which ruby`.chomp, "./lib/writer.rb",@infile,@outfile)
    assert_equal 425,  File.read(@outfile).chomp.length
  end

  def test_case_name

  end

end
