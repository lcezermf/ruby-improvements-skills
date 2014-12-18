### Herança

### Reconhecendo onde usar herança `example_01.rb`

- Iniciando com uma classe concreta

### Adicionando múltiplos tipos `example_01.rb`

- É um antipattern o uso de if, para decidir comportamentos
- Esse tipo de código traz muito problemas, dificultando adição de um novo tipo de spares, caso seja necessário um novo tipo, será preciso mexer no código já existente
- A classe bike agora tem coisas além de sua responsabilidade e poderá mudar a qualquer momento e não poderá ser reutilizada

### Encontrando Tipos embutidos `example_01.rb`

- O Fato de o método spares ter um if que decide quais os valores de determinados atributos de Bicycle é o indicador que poderia ser aplicado Herança para decidir o tipo de Bicycle

### Escolhendo Herança

- Herança provê um meio de que, quando a primeira classe não pode responder a um determinado método, automaticamente ocorre a delegação e sua classe pai deverá ser chamada para tentar responder a mensagem
- Duck Type ocorre através das classes Ruby, geralmente herança não é utilizada para compartilhar comportamentos comuns, Duck Type compartilha código através de Module.

### Aplicando Herança de forma errada `example_01.rb`

- Classes filhas não devem herdar de classes pais, aquilo que elas não devem saber. Ou seja, não devem herdar comportamentos que não irão usar, ou não fazem sentido para elas
- Implementação abstratas dificultam o uso de herança, pois essas classes contem comportamentos atrelados a elas que são especificos.
