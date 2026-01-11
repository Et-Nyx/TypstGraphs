// Main entry point for card presentation
// ========================================
// Import card files and render the radial layout

#import "card-template.typ": *

// Import individual card files
#import "cards/card-01.typ": card as card1
#import "cards/card-02.typ": card as card2
#import "cards/card-03.typ": card as card3
#import "cards/card-04.typ": card as card4
#import "cards/card-05.typ": card as card5

// Page setup
#show: card-page

// Render the radial layout with all cards
#radial-cards(
  header-title: "Recomendações",
  center-title: "Médio",
  center-subtitle: "Prazo",
  center-color: random-color(seed: 1),
  show-lines: true,
  cards: (card1, card2, card3, card4, card5),
)
