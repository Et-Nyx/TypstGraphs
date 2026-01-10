// Main entry point for card presentation
// ========================================
// Import card files and render the radial layout

#import "card-template.typ": *

// Import individual card files
#import "templateCards/card-01.typ": card as card1
#import "templateCards/card-02.typ": card as card2
#import "templateCards/card-03.typ": card as card3
#import "templateCards/card-04.typ": card as card4
#import "templateCards/card-05.typ": card as card5

// Page setup
#show: card-page

// Render the radial layout with all cards
#radial-cards(
  header-title: "Template",
  center-title: "Template",
  center-subtitle: "Template",
  center-color: random-color(seed: 1),
  show-lines: true,
  cards: (card1, card2, card3, card4, card5),
)
