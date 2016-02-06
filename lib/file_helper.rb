require 'pry'


class FileReader

  def self.read(filename)
    #filename = ARGV[0]
    File.read(filename)
    # binding.pry
  end
end

class FileWriter
  def initialize(filename)
    @filename = filename
  end
  def write(out_text)
    #filename = ARGV[1]
    File.write(@filename,out_text)
    @filename
  end

  def write_lines(lines)
    #f = File.new(@filename)
    File.open(@filename,'w'){ |f|
      lines.each{ |top,mid,bot|
        f.puts([top,mid,bot])
      }
    }

    #File.write(@filename,out_text)
    #$stdout.puts "#{lines}"
  end
end
