### Esconder Variáveis de Instância: `example_01.rb`

- Trabalhar com comportamento ao invés dos dados diretamente
- Sempre fazer um wrapper nas variáveis de instância ao invés de usar a referência direta para a variável

### Evitar estruturas de dados escondidas: `example_02.rb`

- Evitar métodos que dependem de múltiplos hash ou arrays, pois essas estruturas podem mudar e ocasionar uma grande mudança interna na implementação
- Essas implementações não são DRY, não encapsulam seu comportamento e se expoem diretamente ao código
- Pior ainda é usar referências como `item[0]`, pois não se sabe o real comportamento e valor do código informado
- Para o Ruby uma boa alternativa ao invés de se usar dados diretamente é simular classes usando `Struct`

### Aplicar Principio da Responsabilidade Única `example_03.rb`

- Método assim como classes também deve obedecer SRP
- Refatorar os métodos de um classe para que todos eles obedecam causa melhorias na classe
- Evitar comentários, pois comentários não são executáveis e podem ficar esquecidos, se alguma parte de um método necessita comentários é melhor extrair essa parte para um método
- Métodos pequenos influenciam o reuso
- Métodos pequenos são fáceis para serem movidos a outras classes, facilitam a melhoria do design.

### Isolar responsabilidades extras para outras classes `example_04.rb`

- O comportamento referente a classe Wheel deve ser extraído para um classe que faça isso

### Considerações Finais

- O ponto de partida para um software fácil de manter e reusar começa com classes que tenha responsabilidades únicas
- Classes que fazem um coisa de modo isolado da aplicação permitem mudanças sem causar outras consequências e permitem reuso sem duplicação.