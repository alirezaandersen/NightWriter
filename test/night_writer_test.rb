require "./lib/night_writer"
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
    assert_equal "Ali and ziba went for a walk", @night.reader
  end


  def test_new_file_is_written
    `rm #{@outfile}` if File.exists?@outfile
    system(`which ruby`.chomp, "./lib/writer.rb",@infile,@outfile)
    assert_equal ["..0.0..0..0.0000..0..00.0....00.00.0..000.0...0....00.0.0.\n","....0.0......0.0...00.0.....00.0.000..0..000......00..0...\n",".0..0.......0.....00.........0..0.0.....0.0........0..0.0.\n"],File.readlines(@outfile)
  end

  def test_returns_out_going_message_length
    system(`which ruby`.chomp, "./lib/reader.rb",@infile,@outfile)
    assert_equal 176,  File.read(@outfile).chomp.length
  end



end
