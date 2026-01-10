// Card Presentation Template for Typst
// =====================================
// Uses CeTZ for precise line drawing

#import "@preview/cetz:0.4.2"

// ============================================
// COLOR PALETTES
// ============================================

// Base vibrant colors
#let colors = (
  // Eixo 1 - Organização Territorial (Blue/Teal)
  eixo1-primary: rgb("#0091AD"),
  eixo1-light: rgb("#B3E5F0"),
  eixo1-accent: rgb("#00C4D4"),
  
  // Eixo 2 - Saúde (Purple/Pink)
  eixo2-primary: rgb("#9B59B6"),
  eixo2-light: rgb("#E8D4F0"),
  eixo2-accent: rgb("#E74C8C"),
  
  // Eixo 3 - Memória e Cultura (Orange/Gold)
  eixo3-primary: rgb("#F39C12"),
  eixo3-light: rgb("#FDE9C8"),
  eixo3-accent: rgb("#E67E22"),
  
  // Regiões (Blue gradient)
  regiao-primary: rgb("#E74C3C"),
  regiao-light: rgb("#D4EDFC"),
  regiao-accent: rgb("#2980B9"),
  
  // Standard vibrant palette
  yellow: rgb("#FFD93D"),
  yellow-light: rgb("#FFF5CC"),
  orange: rgb("#FF8C42"),
  orange-light: rgb("#FFE0CC"),
  green: rgb("#4CAF50"),
  green-light: rgb("#C8E6C9"),
  blue: rgb("#2196F3"),
  blue-light: rgb("#BBDEFB"),
  coral: rgb("#FF6B6B"),
  coral-light: rgb("#FFCDD2"),
  purple: rgb("#AB47BC"),
  purple-light: rgb("#E1BEE7"),
  teal: rgb("#00BCD4"),
  teal-light: rgb("#B2EBF2"),
  cream: rgb("#FDF8E8"),
  white: rgb("#FFFFFF"),
  dark: rgb("#2C3E50"),
  gray: rgb("#7F8C8D"),
  gray-light: rgb("#BDC3C7"),
)

/// Helper to get fill color by name
#let get-fill(name) = {
  if name == "yellow" { colors.yellow-light } 
  else if name == "orange" { colors.orange-light } 
  else if name == "green" { colors.green-light } 
  else if name == "blue" { colors.blue-light } 
  else if name == "coral" { colors.coral-light } 
  else if name == "purple" { colors.purple-light } 
  else if name == "teal" { colors.teal-light }
  else if name == "eixo1" { colors.eixo1-light }
  else if name == "eixo2" { colors.eixo2-light }
  else if name == "eixo3" { colors.eixo3-light }
  else if name == "regiao" { colors.regiao-light }
  else { colors.cream }
}

/// Helper to get stroke color by name
#let get-stroke(name) = {
  if name == "yellow" { colors.yellow } 
  else if name == "orange" { colors.orange } 
  else if name == "green" { colors.green } 
  else if name == "blue" { colors.blue } 
  else if name == "coral" { colors.coral } 
  else if name == "purple" { colors.purple }
  else if name == "teal" { colors.teal }
  else if name == "eixo1" { colors.eixo1-primary }
  else if name == "eixo2" { colors.eixo2-primary }
  else if name == "eixo3" { colors.eixo3-primary }
  else if name == "regiao" { colors.regiao-primary }
  else { colors.gray }
}

// Available color names for cards
#let color-names = ("green", "orange", "yellow", "coral", "blue", "purple", "teal")

/// Returns a random color name from the available colors
/// Use with a seed for consistent results, or without for random each compile
#let random-color(seed: none) = {
  let index = if seed != none {
    calc.rem(seed, color-names.len())
  } else {
    calc.rem(calc.floor(calc.pow(datetime.today().day() * 17 + datetime.today().month() * 31, 2)), color-names.len())
  }
  color-names.at(index)
}

// ============================================
// PAGE SETUP
// ============================================

#let card-page(
  bg-color: colors.cream,
  width: 900pt,
  height: 850pt,
  border: none,  // Optional: e.g. 3pt + colors.eixo1-primary
  border-radius: 15pt,
  body,
) = {
  set page(
    width: width,
    height: height,
    fill: bg-color,
    margin: 30pt,
  )
  set text(
    font: "Arial",
    size: 16pt,
    fill: colors.dark,
  )
  
  // If border is specified, wrap content in a bordered box
  if border != none {
    box(
      width: 100%,
      height: 100%,
      stroke: border,
      radius: border-radius,
      inset: 15pt,
    )[#body]
  } else {
    body
  }
}

// ============================================
// CARD COMPONENTS
// ============================================

/// Creates a central card element
#let central-card(
  title,
  subtitle: none,
  fill: colors.blue,
  width: 180pt,
  height: 100pt,
) = {
  box(
    width: width,
    height: height,
    fill: fill,
    radius: 20pt,
    inset: 15pt,
  )[
    #set align(center + horizon)
    #set text(fill: colors.white, weight: "bold")
    #text(size: 33pt)[#title]
    #if subtitle != none {
      linebreak()
      text(size: 24pt, weight: "regular")[#subtitle]
    }
  ]
}

/// Creates a side card
#let side-card(
  title: none,
  items: (),
  fill: colors.orange-light,
  stroke-color: colors.orange,
  width: 250pt,
) = {
  box(
    width: width,
    fill: fill,
    radius: 12pt,
    stroke: 2pt + stroke-color,
    inset: 12pt,
  )[
    #set text(size: 11pt, fill: colors.dark)
    #set align(left)
    #if title != none {
      text(weight: "bold", size: 15pt)[#title]
      linebreak()
    }
    #for item in items {
      [• #item]
      linebreak()
    }
  ]
}

/// Header banner
#let header-banner(title, fill: colors.blue) = {
  set align(center)
  stack(
    dir: ttb,
    spacing: 4pt,
    text(size: 22pt, weight: "bold", fill: colors.dark)[#title],
    box(width: 100%, height: 5pt, fill: fill, radius: 2pt),
  )
}

// ============================================
// POSITION CALCULATION
// ============================================

#let calc-card-position(index, total, radius: 280pt, start-angle: 135, arc-span: 270) = {
  let angle-step = if total > 1 { arc-span / (total - 1) } else { 0 }
  let angle = start-angle + (index * angle-step)
  let rad = angle * calc.pi / 180

  (radius * calc.cos(rad), radius * calc.sin(rad))
}

// ============================================
// MAIN LAYOUT FUNCTION
// ============================================

#let radial-cards(
  header-title: none,
  center-title: "TÍTULO",
  center-subtitle: none,
  center-color: colors.blue,
  cards: (),
  show-lines: true,
  line-color: colors.gray-light,
  card-radius: 280pt,
  center-offset-y: 60pt,
  start-angle: 135,  // Default: 135 = bottom-left first. Use 270 for top-first
  arc-span: 270,
) = {
  // Header banner
  if header-title != none {
    place(top + center, dy: 10pt, header-banner(header-title, fill: center-color))
  }

  // Draw the connecting lines using CeTZ canvas
  if show-lines and cards.len() > 0 {
    place(
      center + horizon,
      dy: center-offset-y - 20pt,  // Offset lines up a bit from center card
      cetz.canvas(
        length: 1pt, // Set canvas unit to 1pt instead of default 1cm
        {
          import cetz.draw: *

          // Draw lines from center (0,0) to each card position
          for index in range(cards.len()) {
            let pos = calc-card-position(index, cards.len(), radius: card-radius, start-angle: start-angle, arc-span: arc-span)
            let (card-dx, card-dy) = pos
            // Convert length to number (negate Y to match Typst coordinate system)
            let x-end = card-dx / 1pt
            let y-end = -card-dy / 1pt // Invert Y axis
            line((0, 0), (x-end, y-end), stroke: (paint: center-color, thickness: 3pt))
          }
        },
      ),
    )
  }

  // Central card
  place(
    center + horizon,
    dy: center-offset-y,
    central-card(center-title, subtitle: center-subtitle, fill: center-color),
  )

  // Render all side cards
  for (index, card-data) in cards.enumerate() {
    let pos = calc-card-position(index, cards.len(), radius: card-radius, start-angle: start-angle, arc-span: arc-span)
    let (dx, dy) = pos
    let fill = get-fill(card-data.at("color", default: "orange"))
    let stroke = get-stroke(card-data.at("color", default: "orange"))
    let width = card-data.at("width", default: 190pt)

    place(
      center + horizon,
      dx: dx,
      dy: dy + center-offset-y,
      side-card(
        title: card-data.at("title", default: none),
        items: card-data.at("items", default: ()),
        fill: fill,
        stroke-color: stroke,
        width: width,
      ),
    )
  }
}
