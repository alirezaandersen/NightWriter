module Alphabet

  TOP = 0
  MID = 1
  BOT = 2

  BRAILLE_CAP =  ".....0"
  BRAILLE_NUM = ".0.000"
  BRAILLE_SPACE = "......"

  English = {
              "a"=> ["0.","..",".."],
              "b"=> ["0.","0.",".."],
              "c"=> ["00","..",".."],
              "d"=> ["00",".0",".."],
              "e"=> ["0.",".0",".."],
              "f"=> ["00","0.",".."],
              "g"=> ["00","00",".."],
              "h"=> ["0.","00",".."],
              "i"=> [".0","0.",".."],
              "j"=> [".0","00",".."],
              "k"=> ["0.","..","0."],
              "l"=> ["0.","0.","0."],
              "m"=> ["00","..","0."],
              "n"=> ["00",".0","0."],
              "o"=> ["0.",".0","0."],
              "p"=> ["00","0.","0."],
              "q"=> ["00","00","0."],
              "r"=> ["0.","00","0."],
              "s"=> [".0","0.","0."],
              "t"=> [".0","00","0."],
              "u"=> ["0.","..","00"],
              "v"=> ["0.","0.","00"],
              "w"=> [".0","00",".0"],
              "x"=> ["00","..","00"],
              "y"=> ["00",".0","00"],
              "z"=> ["0.",".0","00"],
              "A"=> ["..0.","....",".0.."],
              "B"=> ["..0.","..0.",".0.."],
              "C"=> ["..00","....",".0.."],
              "D"=> ["..00","...0",".0.."],
              "E"=> ["..0.","...0",".0.."],
              "F"=> ["..00","..0.",".0.."],
              "G"=> ["..00","..00",".0.."],
              "H"=> ["..0.","..00",".0.."],
              "I"=> ["...0","..0.",".0.."],
              "J"=> ["...0","..00",".0.."],
              "K"=> ["..0.","....",".00."],
              "L"=> ["..0.","..0.",".00."],
              "M"=> ["..00","....",".00."],
              "N"=> ["..00","...0",".00."],
              "O"=> ["..0.","...0",".00."],
              "P"=> ["..00","..0.",".00."],
              "Q"=> ["..00","..00",".00."],
              "R"=> ["..0.","..00",".00."],
              "S"=> ["...0","..0.",".00."],
              "T"=> ["...0","..00",".00."],
              "U"=> ["..0.","....",".000"],
              "V"=> ["..0.","..0.",".000"],
              "W"=> ["...0","..00",".0.0"],
              "X"=> ["..00","....",".000"],
              "Y"=> ["..00","...0",".000"],
              "Z"=> ["..0.","...0",".000"],
              "cap"=> ["..","..",".0"],
              " "=> ["..","..",".."],
              "!"=> ["..","00","0."],
              "'"=> ["..","..","0."],
              ","=> ["..","0.",".."],
              "-"=> ["..","..","00"],
              "."=> ["..","00",".0"],
              "?"=> ["..","0.","00"],
              "#"=> [".0",".0","00"]
             }
  EnglishNumber = {
              "0"=> [".0","00",".."], #j
              "1"=> ["0.","..",".."], #a
              "2"=> ["0.","0.",".."], #b
              "3"=> ["00","..",".."], #c
              "4"=> ["00",".0",".."], #d
              "5"=> ["0.",".0",".."], #e
              "6"=> ["00","0.",".."], #f
              "7"=> ["00","00",".."], #g
              "8"=> ["0.","00",".."], #h
              "9"=> [".0","0.",".."]  #i
                  }
  Braille = {
                "0....." => "a",
                "0.0..." => "b",
                "00...." => "c",
                "00.0.." => "d",
                "0..0.." => "e",
                "000..." => "f",
                "0000.." => "g",
                "0.00.." => "h",
                ".00..." => "i",
                ".000.." => "j",
                "0...0." => "k",
                "0.0.0." => "l",
                "00..0." => "m",
                "00.00." => "n",
                "0..00." => "o",
                "000.0." => "p",
                "00000." => "q",
                "0.000." => "r",
                ".00.0." => "s",
                ".0000." => "t",
                "0...00" => "u",
                "0.0.00" => "v",
                ".000.0" => "w",
                "00..00" => "x",
                "00.000" => "y",
                "0..000" => "z",
               ".....00....." => "A",
               ".....00.0..." => "B",
               ".....000...." => "C",
               ".....000.0.." => "D",
               ".....00..0.." => "E",
               ".....0000..." => "F",
               ".....00000.." => "G",
               ".....00.00.." => "H",
               ".....0.00..." => "I",
               ".....0.000.." => "J",
               ".....00...0." => "K",
               ".....00.0.0." => "L",
               ".....000..0." => "M",
               ".....000.00." => "N",
               ".....00..00." => "O",
               ".....0000.0." => "P",
               ".....000000." => "Q",
               ".....00.000." => "R",
               ".....0.00.0." => "S",
               ".....0.0000." => "T",
               ".....00...00" => "U",
               ".....00.0.00" => "V",
               ".....0.000.0" => "W",
               ".....000..00" => "X",
               ".....000.000" => "Y",
               ".....00..000" => "Z",
               ".....0" => "cap",
               "......" => " ",
               "..000." => "!",
               "....0." => "'",
               "..0..." => ",",
               "....00" => "-",
               "..00.0" => ".",
               "..0.00" => "?",
               ".0.000" => "#",                             }
  BrailleNumber = {
               ".000.." => "0",
               "0....." => "1",
               "0.0..." => "2",
               "00...." => "3",
               "00.0.." => "4",
               "0..0.." => "5",
               "000..." => "6",
               "0000.." => "7",
               "0.00.." => "8",
               ".00..." => "9",
                  }
=begin  Contract_ASCII = {
              "a"=> "a",
              "but"=> "b",
              "can"=> "c",
              "do"=> "d",
              "every"=> "e",
              "from"=> "f",
              "go"=> "g",
              "have"=> "h",
              "just"=> "j",
              "knowledge"=> "k",
              "like"=> "l",
              "more"=> "m",
              "not"=> "n",
              "people"=> "p",
              "quite"=> "q",
              "rather"=> "r",
              "so"=> "s",
              "that"=> "t",
              "us"=> "u",
              "very"=> "v",
              "will"=> "w",
              "it"=> "x",
              "you"=> "y",
              "as"=> "z",
              "child"=> "<",
              "shall"=> ">",
              "this"=> "[",
              "which"=> "]",
              "out"=> "{",
              "enough"=> "}",
              "were"=> "=",
              "in"=> "^"
                  }

  ASCII_Braille = {
              "a"=> ["0.","..",".."],
              "b"=> ["0.","0.",".."],
              "c"=> ["00","..",".."],
              "d"=> ["00",".0",".."],
              "e"=> ["0.",".0",".."],
              "f"=> ["00","0.",".."],
              "g"=> ["00","00",".."],
              "h"=> ["0.","00",".."],
              "j"=> [".0","00",".."],
              "k"=> ["0.","..","0."],
              "l"=> ["0.","0.","0."],
              "m"=> ["00","..","0."],
              "n"=> ["00",".0","0."],
              "p"=> ["00","0.","0."],
              "q"=> ["00","00","0."],
              "r"=> ["0.","00","0."],
              "s"=> [".0","0.","0."],
              "t"=> [".0","00","0."],
              "u"=> ["0.","..","00"],
              "v"=> ["0.","0.","00"],
              "w"=> [".0","00",".0"],
              "x"=> ["00","..","00"],
              "y"=> ["00",".0","00"],
              "z"=> ["0.",".0","00"],
              "<"=> ["0.","..",".0"],
              ">"=> ["00","..","0"],
              "["=> ["00",".0",".0"],
              "]"=> ["0.",".0",".0"],
              "{"=> ["0.","00",".0"],
              "}"=> ["..","0.",".0"],
              "="=> ["..","00","00"],
              "^"=> ["..",".0","0."]
                  }


  Braille = {
              31=>"a",
              23=>"b",
              15=>"c",
              11=>"d",
              27=>"e",
              7=>"f",
              3=>"g",
              19=>"h",
              39=>"i",
              35=>"j",
              29=>"k",
              21=>"l",
              13=>"m",
              9=>"n",
              25=>"o",
              5=>"p",
              1=>"q",
              17=>"r",
              37=>"s",
              33=>"t",
              28=>"u",
              20=>"v",
              34=>"w",
              12=>"x",
              8=>"y",
              24=>"z",
              62=>"cap",
              63=>" ",
              49=>"!",
              61=>"'",
              55=>",",
              60=>"-",
              50=>".",
              52=>"?",
              40=>"#"
            }

  BrailleNumber = {
              35=>"0",
              31=>"1",
              23=>"2",
              15=>"3",
              11=>"4",
              27=>"5",
              7=>"6",
              3=>"7",
              19=>"8",
              39=>"9"
                  }
=end

end
