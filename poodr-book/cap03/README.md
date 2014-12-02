### Entendendo dependências `example_01.rb`

- Um objeto depende de outro, quando a mudança no primeiro objeto irá forçar uma mudança no segundo
- Um classe que depende ou sabe demais de outra se torna menos aproveitavel

### Reconhecendo dependências `example_01.rb`

- Um objeto possui dependências quando:
  - Sabe o nome de outra classe (`Gear` espera que uma classe chamada `Wheel` exista)
  - O nome do método que esperar ser chamado pela outra classe (`Gear` espera que uma instância de `Wheel` responda a `diameter`)
  - Os argumentos que esse método precisa (`Gear` sabe que `Wheel.new` era  `rim` e `tire`)
  - A ordem desses argumentos
- Todas esas dependências poderão forçar uma mudança em `Gear` caso haja alguma mudança em `Wheel`
- Uma classe deve saber apenas o suficiente para fazer o seu trabalho e nada além disso

### Injeção de dependências `example_02.rb`

- No exemplo a class `Gear` possui um dependências explicita para `Wheel`
- Caso o nome da classe mude, será preciso mudar a chamada em `Gear` também
- O maior problema está no fato de que a classe `Gear` usar explicitamente `Wheel` fecha seu escopo para somente calcular `gear_inches`
de instâncias de `Wheel`, sendo assim ela não é um classe que pode ser reutilizada, caso outra classe possua comportamentos como `diamenter`
- Se alguma outra classe precisar realizar o cálculo de `gear_inches` essa classe `Gear` não poderá ser reutilizada por causa da dependências explicita
- `Gear` não precisa saber o objeto que cálcula `diamenter` é um `Wheel` ele apenas precisa de um objeto que entenda e responda a `diameter`

### Isolando as dependências `exemplo_03.rb`

- Preferencialmente isole a criação de uma nova instância de outra classe
  - Realizar a instanciação do novo objeto na inicialização do primeiro
  - Criar um método para isolar a criação

### Isolando chamada para métodos externos `example_03.rb`

- Ocorre quando a classe que está sendo executada dentro de outra, faz chamada a seus métodos
  - Classe A recebe B como dependência, a para o método A#x ela precisar internamente executar o método B#y, dependendo da situação, é preciso isolar a chamada do método B#y dentro de outro metodo em A- É importante
- Caso mais pontos da classe A precisem da chamada ela está isolada em seu próprio método e ainda poderá facilitar futuras alterações e correções
- Se a classe B alterar o nome do seu método que é utilizado em A#x, a classe A só precisa fazer mudança em um lugar

### Remover a depêndencia de ordem de argumentos `example_03.rb`

- A inicialização de uma classe que recebe muitos argumentos é perigoso, pois se ao realizar a chamada para essa classe um dos valores for trocado, a classe não será instânciada, ou pior, se houver alguma mudanção nessa assinatura, ela irá se propagar para todos os lugares onde a classe é chamada
- É importante utilizar um Hash de opções para criação de instâncias de classes
- Usando um Hash, é completamente removida a dependências de ordem de argumentos
- Caso seja necessário um novo argumento é só alterar o método #initialize da classe e passar o novo argumento ao hash
- Deixa claro quais as dependências e onde ela são usadas

### Valores Default de forma explícita `example_03.rb`

- Para um non-boolean uma das maneiras é utilizar o operador `||` que tem o mesmo efeito de OR
- `[]` da class `Hash` irá retornar `nil` para caso de faltar a key passada, o que poderá ocasionar um erro caso o Hash passado não tenha a chave e seja usado a condição com `||`
- Método `fetch` previne esse erro
- Também é possível remover os defaults da inicialização de um objeto para um método privado,
e esse método retornar um `hash` que usará o método `merge` para mergear valores diferentes informados na inicialização do novo objeto

### Isolar multiparametros da inicialização `example_03.rb`

- Em situações onde você não tem controle e não pode alterar a assinatura de um método, por exemplo de uma aplicação externa
a melhor saída é criar um módulo que você tenha controle e realizar um wrapper sobre essa dependência externa
- Criar um Wrapper remove a dependência externa e cria um interface da sua própria aplicação para manter esse contato com o outro serviço
