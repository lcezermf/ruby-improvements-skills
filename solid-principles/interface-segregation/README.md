** Princípio da Segregação de Interface (ISP) **

- Trata da coesão de interfaces, onde as classes clientes não devem ser forçadas a depender de métodos que não usam
- A classe cliente depende de uma interface que possui métodos que ela não utiliza, mas outras classes que utilizam essa interface o utilizam,
então uma mudança nessa interface pode afetar o comportamento da classe, mesmo ela não utilizando outros métodos.
- Generalização de interface para uso das classes pode causar esses problemas.
- Uma solução seria ter classes/interfaces mais específicas.
- Uma classe não deve ser forçada a depender de métodos que ela não utiliza