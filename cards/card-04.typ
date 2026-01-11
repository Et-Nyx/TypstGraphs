// Card 04 - Longo prazo
// Color defaults to random based on card index, but can be overridden

#import "../card-template.typ": random-color

#let card = (
  title: "Longo prazo:",
  color: random-color(seed: 4), // Change to e.g. "coral" to set manually
  width: 200pt,
  items: (
    "Criar centro regional de fortalecimento cultural quilombola;",
    "Desenvolver ações duradouras de combate ao racismo",
  ),
)
