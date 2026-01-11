// Card 03 - Médio prazo
// Color defaults to random based on card index, but can be overridden

#import "../card-template.typ": random-color

#let card = (
  title: "Médio prazo:",
  color: random-color(seed: 3), // Change to e.g. "yellow" to set manually
  width: 210pt,
  items: (
    "Implementar linhas de cuidados para pessoas em situações de saúde crônicas;",
    "Implantar a Política Municipal de Promoção à Saúde da População Negra e Quilombola",
  ),
)
