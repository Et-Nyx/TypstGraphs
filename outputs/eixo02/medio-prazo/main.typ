// Eixo 2 - Recomendações de Médio Prazo
// Saúde
// ========================================

#import "/card-template.typ": *

// Import individual card files
#import "cards/card-01.typ": card as card1
#import "cards/card-02.typ": card as card2
#import "cards/card-03.typ": card as card3
#import "cards/card-04.typ": card as card4
#import "cards/card-05.typ": card as card5
#import "cards/card-06.typ": card as card6
#import "cards/card-07.typ": card as card7

// Page setup with border
#show: card-page.with(border: 3pt + colors.eixo2-primary)

// Render the radial layout with all cards
#radial-cards(
  header-title: "Recomendações de Médio Prazo",
  center-title: "EIXO 2",
  center-subtitle: "Médio Prazo",
  center-color: colors.eixo2-primary,
  show-lines: true,
  cards: (card1, card2, card3, card4, card5, card6, card7),
)
