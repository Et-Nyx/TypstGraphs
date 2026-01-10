# Typst Infograph Generator

A Typst-based template for creating radial card infographics, specifically designed for the SESAP/RN Quilombola Health Report (Produto 3).

## Features

- **16 Pre-built Infographs**: 9 Eixo diagrams + 7 Regional health recommendations
- **Topic-based Colors**: Eixo 1 (Teal), Eixo 2 (Purple), Eixo 3 (Orange), Regiões (Red)
- **Modular Cards**: Each card defined in its own file for easy editing
- **Radial Layout**: Cards auto-positioned in arc around center
- **DOCX Integration**: Python script to replace images in existing DOCX

## Requirements

- [Typst](https://typst.app/) 0.14+
- Python 3.x (for DOCX image replacement)

## Quick Start

### Generate Infograph PNGs

```bash
# Compile a single infograph
typst compile outputs/eixo01/curto-prazo/main.typ outputs/eixo01/curto-prazo/output.png --root .

# Compile all infographs (run from project root)
for dir in outputs/eixo*/*/; do typst compile "$dir/main.typ" "$dir/output.png" --root .; done
for dir in outputs/regioes/*/; do typst compile "$dir/main.typ" "$dir/output.png" --root .; done
```

### Replace Images in DOCX

```bash
python replace_images.py
```

This reads `docFile/Final - 09.01.2025_PRODUTO 3.docx` and outputs `outputs/Final_Updated.docx` with all infograph images replaced.

## Project Structure

```
├── card-template.typ       # Main template library
├── replace_images.py       # DOCX image replacement script
├── docFile/                # Original DOCX document
├── outputs/
│   ├── eixo01/             # Eixo 1 infographs (curto/medio/longo)
│   ├── eixo02/             # Eixo 2 infographs
│   ├── eixo03/             # Eixo 3 infographs
│   ├── regioes/            # Regional infographs (01,03,04,05,06,07,08)
│   ├── image_mapping.md    # Figure-to-file mapping reference
│   └── docx_content.md     # Extracted DOCX text content
└── images/                 # Reference images
```

## Infograph Mapping

| Figures | Content | Location |
|---------|---------|----------|
| 1-3 | Eixo 1 (Curto/Médio/Longo) | `outputs/eixo01/*/output.png` |
| 4-6 | Eixo 2 (Curto/Médio/Longo) | `outputs/eixo02/*/output.png` |
| 7-9 | Eixo 3 (Curto/Médio/Longo) | `outputs/eixo03/*/output.png` |
| 11,13,15,17,19,21,23 | Regiões 1,3,4,5,6,7,8 | `outputs/regioes/regiao*/output.png` |

## Customization

Edit `card-template.typ` to modify:
- `topic-colors`: Color schemes per topic
- `side-card`: Card width, font size, styling
- `radial-cards`: Arc positioning, line styles

## License

MIT
