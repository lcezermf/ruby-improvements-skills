### Interfaces `example_01.rb`

- Interfaces públicas:
  - Revelam responsabilidades primárias
  - Espera que sejam invocadas por outras classes
  - São estáveis (não irão mudar com frequência)
  - São seguros para quem depende deles (não é ideal que a sua assinatura mude)
  - Devem ser documentadas e testadas
  - Devem dizer mais sobre O QUE ao invés de COMO (nome do método deve identificar sua ação e não seus detalhes)
  - Hash com paramêtros opcionais são recomendados para maior flexibilidade

- Interfaces privadas:
  - Lidam com detalhes de implementação
  - Não são invocados por outros de fora da classe
  - Não são seguros para outras classes que dependam delas diretamento (nem devem depender diretamente delas)

- Tell don't Ask / Se preocupar mais com `O que` o invés de `Como`

- Encontrando os contextos
  - Objetos com um contexto simples, são mais fáceis de reusar e testar
  - Objetos com um contexto complexo, são complicados de reusar e testar

- Lei de Demeter
  - "Só converse com seu vizinho imediato" ou "Use apenas um `.`"
  -
