require 'pry'


class FileReader
  def self.read
    filename = ARGV[0]
    File.read(filename)
    # binding.pry
  end
end

class FileWriter
  def write(out_text)
    filename = ARGV[1]
    File.write(filename,out_text)
    filename
  end
end
