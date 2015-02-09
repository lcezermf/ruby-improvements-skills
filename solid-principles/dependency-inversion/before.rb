=begin
O exemplo viola DIP pois a classe FileParser tem um dependência direta de JsonParse para realizar o parser
Sendo que ela precisaria ser mais abstrata p/ conseguir realizar o parse para outros formatos além do Json
=end
class FileParser
  def initialize(file)
    @file = file
  end

  def parse
    JsonParse.new(@file).parse
  end
end
