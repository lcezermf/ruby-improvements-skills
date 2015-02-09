=begin
Essa classe viola o OCP,
pois caso seja necessário mudar a forma de exibição do arquivo
ou adicionar uma nova forma de exibição, será preciso alterar o código já existente.
=end
class FileParser
  def initialize(file)
    @file = file
  end

  def parse
    case @file.extension
    when :xml  then parse_xml
    when :json then parse_json
    #when :x then parse_x
    #when :y then parse_y
    end
  end
end
