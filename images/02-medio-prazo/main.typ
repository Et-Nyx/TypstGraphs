// Image 02 - Recomendações de Médio Prazo
#import "../../card-template.typ": *

#import "card-01.typ": card as card1
#import "card-02.typ": card as card2
#import "card-03.typ": card as card3

#show: card-page

#radial-cards(
  header-title: "Recomendações de Médio Prazo",
  center-title: "Eixo 2",
  center-subtitle: "Médio Prazo",
  center-color: get-stroke("yellow"),
  show-lines: true,
  cards: (card1, card2, card3),
)
