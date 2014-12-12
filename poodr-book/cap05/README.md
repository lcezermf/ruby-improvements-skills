### Reconhecendo uso de Duck Type Oculto

- Alguns pontos da aplicação podem indicar que Duck Type poderia ser usado, são esses pontos:
  - Switch/Case em classes
  - `kind_of?` and `is_a?`
  - `respond_to?`

- Duck Typing tiram interfaces públicas de classes especificas
- Criam interfaces virtuais que são definidas por o que elas fazem ao inves de quem elas são
- DT pode reduzir riscos, aumentam a flexibilidade e fazem sua aplicação mais barata e fácil de manter.
