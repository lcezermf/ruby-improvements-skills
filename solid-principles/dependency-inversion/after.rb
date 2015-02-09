=begin
Usando a inversão de dependência a class FileParser não depende diretamente mais de um parse único, podendo realizar diferentes parses
somente mundando a classe que será injetada
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
