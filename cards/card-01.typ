// Card 01 - Curto prazo
// Color defaults to random based on card index, but can be overridden

#import "../card-template.typ": random-color

#let card = (
  title: "Curto prazo:",
  color: random-color(seed: 1), // Change to e.g. "green" to set manually
  width: 200pt,
  items: (
    "Qualificar acolhimento antirracista;",
    "Ampliar busca ativa de gestantes e crianças;",
    "Realizar oficinas sobre anemia falciforme",
  ),
)
