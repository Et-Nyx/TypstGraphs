// Card Template
// Color defaults to random based on card index, but can be overridden

#import "../card-template.typ": random-color

#let card = (
  title: "Template:",
  color: random-color(seed: 5), // Change to e.g. "blue" to set manually
  width: 200pt,
  items: (
    "Item 1",
    "Item 2",
    "Item 3",
  ),
)
