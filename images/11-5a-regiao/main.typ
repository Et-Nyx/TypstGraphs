// Image 11 - 5ª Região de Saúde
#import "../../card-template.typ": *

#import "card-01.typ": card as card1
//#import "card-02.typ": card as card2
#import "card-03.typ": card as card3
#import "card-04.typ": card as card4

#show: card-page

#radial-cards(
  header-title: "Recomendações para Região",
  center-title: "5ª Região",
  center-subtitle: "de Saúde",
  center-color: get-stroke("blue"),
  show-lines: true,
  cards: (card1, card3, card4),
)
