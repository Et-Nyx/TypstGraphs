// Image 05 - Recomendações de Curto Prazo (Saúde)
#import "../../card-template.typ": *

#import "card-01.typ": card as card1
#import "card-02.typ": card as card2
#import "card-03.typ": card as card3
#import "card-04.typ": card as card4
#import "card-05.typ": card as card5
#import "card-06.typ": card as card6

#show: card-page

#radial-cards(
  header-title: "Recomendações de Curto Prazo",
  center-title: "Eixo 2",
  center-subtitle: "Curto Prazo",
  center-color: get-stroke("purple"),
  show-lines: true,
  cards: (card1, card2, card3, card4, card5, card6),
)
