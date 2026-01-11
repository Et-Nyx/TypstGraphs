// Image 06 - Recomendações a Médio Prazo
#import "../../card-template.typ": *

#import "card-01.typ": card as card1
#import "card-02.typ": card as card2
#import "card-03.typ": card as card3
#import "card-04.typ": card as card4
#import "card-05.typ": card as card5
#import "card-06.typ": card as card6
#import "card-07.typ": card as card7

#show: card-page

#radial-cards(
  header-title: "Recomendações de Médio Prazo",
  center-title: "Eixo 2",
  center-subtitle: "Médio Prazo",
  center-color: get-stroke("yellow"),
  show-lines: true,
  cards: (card1, card2, card3, card4, card5, card6, card7),
)
