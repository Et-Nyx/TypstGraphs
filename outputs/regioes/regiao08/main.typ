// Região 08 - 8ª Região de Saúde
#import "/card-template.typ": *
#import "cards/card-01.typ": card as card1
#import "cards/card-02.typ": card as card2
#import "cards/card-03.typ": card as card3
#show: card-page.with(border: 3pt + colors.regiao-primary)
#radial-cards(
  header-title: "Recomendações",
  center-title: "8ª REGIÃO",
  center-subtitle: "de Saúde",
  center-color: colors.regiao-primary,
  show-lines: true,
  cards: (card2, card1, card3),
)
