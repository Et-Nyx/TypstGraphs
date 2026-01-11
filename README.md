# Typst Card Presentation Template

A modular Typst template for creating card-based presentation graphics with radial layouts and connecting lines.

## Features

- **Modular cards**: Each card defined in its own file
- **Auto-positioning**: Cards distributed in a 270° arc around center
- **Star-style lines**: Connecting lines from center to each card using CeTZ
- **Color themes**: Green, orange, yellow, coral, blue, purple

## Requirements

- [Nix](https://nixos.org/) (for `nix-shell`)
- Typst 0.14+ (provided via nix-shell)

## Quick Start

1. Enter the development environment:
   ```bash
   nix-shell
   ```

2. Compile to PNG:
   ```bash
   typst compile --root . main.typ output.png
   ```

3. Watch for changes:
   ```bash
   typst watch --root . main.typ output.png
   ```

## Project Structure

```
├── shell.nix           # Nix environment
├── card-template.typ   # Template library
├── main.typ            # Entry point
├── cards/              # Card content files
│   ├── card-01.typ
│   ├── card-02.typ
│   └── ...
└── images/             # Reference images
```

## Adding Cards

Create a new file `cards/card-XX.typ`:

```typst
#let card = (
  title: "Card Title",
  color: "green",  // green, orange, yellow, coral, blue, purple
  items: (
    "First item",
    "Second item",
  ),
)
```

Then import it in `main.typ`:

```typst
#import "cards/card-XX.typ": card as cardX
// Add to cards array:
cards: (card1, card2, ..., cardX),
```

## Color Randomizer

Cards use `random-color(seed: N)` by default, which picks from: green, orange, yellow, coral, blue, purple.

To set a color manually, replace `random-color(seed: N)` with a color name:
```typst
color: "coral",  // Manual color
```

Or use the randomizer with a different seed:
```typst
color: random-color(seed: 42),  // Consistent random
```

## Customization

In `main.typ`, you can customize:

- `header-title`: Top banner text
- `center-title` / `center-subtitle`: Central card text
- `center-color`: Central card and header color
- `show-lines`: Toggle connecting lines (true/false)

## License

MIT
