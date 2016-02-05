module Alphabet

  TOP = 0
  MID = 1
  BOT = 2

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
              "0"=> [".0","00",".."],
              "1"=> ["0.","..",".."],
              "2"=> ["0.","0.",".."],
              "3"=> ["00","..",".."],
              "4"=> ["00",".0",".."],
              "5"=> ["0.",".0",".."],
              "6"=> ["00","0.",".."],
              "7"=> ["00","00",".."],
              "8"=> ["0.","00",".."],
              "9"=> [".0","0.",".."]
                  }
  Contract_ASCII = {
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


end
