require 'pry'


class FileReader

  def self.read(filename)
    File.read(filename)
    # binding.pry
  end

  def self.readlines(filename)
    File.readlines(filename)
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
    #f = File.new(@filename)
    File.open(@filename,'w'){ |f|
      lines.each{ |top,mid,bot|
        f.puts([top,mid,bot])
      }
    }
  end
end
