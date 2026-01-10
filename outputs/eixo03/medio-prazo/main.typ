// Eixo 3 - Recomendações de Médio Prazo
// Memória e Cultura
// ========================================

#import "/card-template.typ": *

// Import individual card files
#import "cards/card-01.typ": card as card1
#import "cards/card-02.typ": card as card2
#import "cards/card-03.typ": card as card3
#import "cards/card-04.typ": card as card4
#import "cards/card-05.typ": card as card5

// Page setup with border
#show: card-page.with(border: 3pt + colors.eixo3-primary)

// Render the radial layout with all cards
#radial-cards(
  header-title: "Recomendações de Médio Prazo",
  center-title: "EIXO 3",
  center-subtitle: "Médio Prazo",
  center-color: colors.eixo3-primary,
  show-lines: true,
  cards: (card1, card2, card3, card4, card5),
)
