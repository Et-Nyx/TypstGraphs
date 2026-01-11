// Image 04 - Recomendações de Longo Prazo Eixo 1
#import "../../card-template.typ": *

#import "card-01.typ": card as card1
#import "card-02.typ": card as card2
#import "card-03.typ": card as card3

#show: card-page

#radial-cards(
  header-title: "Recomendações de Longo Prazo",
  center-title: "Eixo 1",
  center-subtitle: "Longo Prazo",
  center-color: get-stroke("coral"),
  show-lines: true,
  cards: (card1, card2, card3),
)
