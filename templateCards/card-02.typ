// Card Template
// Color defaults to random based on card index, but can be overridden

#import "../card-template.typ": random-color

#let card = (
  title: "Template:",
  color: random-color(seed: 2), // Change to e.g. "orange" to set manually
  width: 210pt,
  items: (
    "Item 1",
    "Item 2",
    "Item 3",
  ),
)
