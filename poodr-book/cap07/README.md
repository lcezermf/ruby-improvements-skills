### Antipatterns de uso de Herança

- Objetos que utilizam atributos com o nome de `type`, `kind`, `category` para determinar que tipo de mensagem deve ser executada,
de acordo com o tipo do objeto são candidatas a sofrerem o uso de herança.
- Problemas de manutenção podem surgir, uma vez que o código poderá sofrer alterações toda vez que um novo tipo for adicionado.
- Códigos assim podem ser melhorados fazendo uso de herança simples, onde o código comum é colocado em uma classe abstratada
e cada novo tipo irá herdar essa classe.
- Assim o código cresce sem que seja necessário alterar o antigo, (Open/Closed)

### Abstração

- Todo código em uma superclasse abstrata poderá ser aplicado para as classes que o herdam, superclasses devem conter
código que é aplicado para algumas, mas não todas subclasses.
- Isso também se aplica a módulos: todos os métodos nele, podem ser aplicado na classe que os inclui.
- Subclasses que sobrescrevem métodos para dizer "essa classe não implementa esse método" são sintomas de problema, uma vez que o
método não faz sentido a ela, talvez seja melhor tomar cuidado com a herança.
- Subclasses devem respeitar o "contrato" assinado com a superclasse, LISKOV Principle
