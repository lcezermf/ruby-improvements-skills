=begin
Agora sempre que um novo parser for necessário é só criar uma nova classe *Parser que implemente o método #parse
E usar a Injeção de Dependência para injetar o parser a ser usado.
=end
class JsonParser
  def parse(file)
    "#{file}.json"
  end
end

class XmlParser
  def parse(file)
    "#{file}.xml"
  end
end

class FileParser
  def initialize(file, parser)
    @file, @parser = file, parser
  end

  def parse
    @parser.parse @file
  end
end

###

FileParser.new('file', JsonParser.new).parse
