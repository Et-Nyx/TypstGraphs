// Eixo 1 - Recomendações de Curto Prazo
// Organização Territorial e Logística
// ========================================

#import "/card-template.typ": *

// Import individual card files
#import "cards/card-01.typ": card as card1
#import "cards/card-02.typ": card as card2
#import "cards/card-03.typ": card as card3

// Page setup with border
#show: card-page.with(border: 3pt + colors.eixo1-primary)

// Render the radial layout with all cards
#radial-cards(
  header-title: "Recomendações de Curto Prazo",
  center-title: "EIXO 1",
  center-subtitle: "Curto Prazo",
  center-color: colors.eixo1-primary,
  show-lines: true,
  cards: (card1, card2, card3),
)
