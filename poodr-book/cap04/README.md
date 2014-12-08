### Interfaces

- Interfaces públicas:
  - Revelam responsabilidades primárias
  - São invocados por outros
  - São seguros para quem depende deles (não é ideal que a sua assinatura mude)

- Interfaces privadas:
  - Lidam com detalhes de implementação
  - Não são invocados por outros de fora da classe
  - Não são seguros (e nem devem) ser chamados por classes externas