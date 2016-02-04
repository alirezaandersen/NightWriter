require 'pry'
require_relative 'file_helper'


class NightReader


  attr_reader :file_reader

  def initialize
    @reader = FileReader.new
  end


end
