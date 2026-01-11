// Card 05 - Novo plano de ação
// Color defaults to random based on card index, but can be overridden

#import "../card-template.typ": random-color

#let card = (
  title: "Novo plano de ação",
  color: random-color(seed: 5), // Change to e.g. "blue" to set manually
  width: 200pt,
  items: (
    "Incluir ações de combate ao racismo no plano de ação;",
    "Desenvolver ações duradouras de combate ao racismo",
    "Ações de combate ao racismo",
  ),
)
