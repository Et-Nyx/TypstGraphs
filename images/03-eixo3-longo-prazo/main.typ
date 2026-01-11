// Image 03 - Eixo 3 Recomendações a Longo Prazo
#import "../../card-template.typ": *

#import "card-01.typ": card as card1
#import "card-02.typ": card as card2
#import "card-03.typ": card as card3
#import "card-04.typ": card as card4
#import "card-05.typ": card as card5
#import "card-06.typ": card as card6
#import "card-07.typ": card as card7
#import "card-08.typ": card as card8
#import "card-09.typ": card as card9
#import "card-10.typ": card as card10

#show: card-page

#radial-cards(
  header-title: "Recomendações de Longo Prazo",
  center-title: "Eixo 3",
  center-subtitle: "Longo Prazo",
  center-color: get-stroke("orange"),
  show-lines: true,
  card-radius: 320pt,
  cards: (card1, card2, card3, card4, card5, card6, card7, card8, card9, card10),
)
