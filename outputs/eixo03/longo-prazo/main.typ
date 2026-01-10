// Eixo 3 - Recomendações de Longo Prazo
// Memória e Cultura
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
#import "cards/card-08.typ": card as card8
#import "cards/card-09.typ": card as card9
#import "cards/card-10.typ": card as card10

// Page setup with border - use larger dimensions for 10 cards
#show: card-page.with(
  border: 3pt + colors.eixo3-primary,
  width: 1000pt,
  height: 950pt,
)

// Render the radial layout with all cards
#radial-cards(
  header-title: "Recomendações de Longo Prazo",
  center-title: "EIXO 3",
  center-subtitle: "Longo Prazo",
  center-color: colors.eixo3-primary,
  show-lines: true,
  card-radius: 350pt,
  cards: (card1, card2, card3, card4, card5, card6, card7, card8, card9, card10),
)
