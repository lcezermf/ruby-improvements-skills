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
