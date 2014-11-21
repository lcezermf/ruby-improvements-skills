### Esconder Variáveis de Instância: `example_01.rb`

- Trabalhar com comportamento ao invés dos dados diretamente
- Sempre fazer um wrapper nas variáveis de instância ao invés de usar a referência direta para a variável

### Evitar estruturas de dados escondidas: `example_02.rb`

- Evitar métodos que dependem de múltiplos hash ou arrays, pois essas estruturas podem mudar e ocasionar uma grande mudança interna na implementação
- Essas implementações não são DRY, não encapsulam seu comportamento e se expoem diretamente ao código
- Pior ainda é usar referências como `item[0]`, pois não se sabe o real comportamento e valor do código informado
- Para o Ruby uma boa alternativa ao invés de se usar dados diretamente é simular classes usando `Struct`