require 'pry'


class FileReader

  def self.read(filename)
    # binding.pry
    File.read(filename)
  end

  def self.readlines(filename)
    # binding.pry
    braille_lines = []
    lines = File.read(filename).split("\n")
    until lines.empty? do braille_lines << lines.shift(3) end
    (top,mid,bot) = braille_lines.transpose.map{|line| line.join}
  end
end

class FileWriter

  def initialize(filename)
    @filename = filename
  end

  def write_line(line)
    File.open(@filename,'w'){ |f|
      f.puts(line)
    }
  end

  def write_lines(lines)
    File.open(@filename,'w'){ |f|
      lines.each{ |top,mid,bot|
        f.puts([top,mid,bot])
      }
    }
  end
end
