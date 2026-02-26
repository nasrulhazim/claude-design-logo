# Claude Design Logo

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg?style=flat-square)](https://opensource.org/licenses/MIT)

A Claude Code slash command for designing complete SVG logo systems. Follows a proven methodology from discovery through finalization.

## Installation

```bash
curl -fsSL https://raw.githubusercontent.com/nasrulhazim/claude-design-logo/main/install.sh | bash
```

Or clone and install locally:

```bash
git clone https://github.com/nasrulhazim/claude-design-logo.git
cd claude-design-logo
bash install.sh
```

## Usage

| Command              | Description                                |
| -------------------- | ------------------------------------------ |
| `/design-logo`       | Start full logo design process (Phase 1-3) |
| `/design-logo refine`| Refine an existing logo (Phase 2-3 only)   |
| `/design-logo icons` | Generate icon alternatives (Phase 3)       |

## How It Works

### Phase 1: Discovery & Mass Exploration

1. Gathers brand information (name, tagline, audience)
2. Gets style and color direction from you
3. Generates 25 diverse SVG logo concepts
4. Creates an interactive preview gallery (`tinker/preview.html`)

### Phase 2: Selection & Refinement

1. You pick a direction from the 25 concepts
2. Creates logo variants (dark/light wordmark + icon)
3. Builds comprehensive preview with mockups (navbar, browser, mobile, favicon)

### Phase 3: Iteration

1. Iterates based on your feedback
2. Generates icon alternatives if needed with comparison page
3. Finalizes the chosen design

## Output

All files are generated in the `tinker/` directory:

```text
tinker/
├── logo-{01..25}-{name}.svg           # 25 concepts
├── preview.html                        # Gallery preview
├── logo-dark.svg                       # Final wordmark (dark bg)
├── logo-light.svg                      # Final wordmark (light bg)
├── logo-icon-dark.svg                  # Final icon (dark bg)
├── logo-icon-light.svg                 # Final icon (light bg)
├── logo-preview.html                   # Comprehensive preview
├── icon-{a..d}-{name}-{dark|light}.svg # Icon alternatives
└── icon-compare.html                   # Icon comparison
```

## Design Principles

- Dark mode first (navy #0B1120 background)
- Size-aware (wordmark >= 140px, icon <= 80px)
- High contrast for legibility in both modes
- Simplicity that scales to small sizes
- Consistent brand color palette

## License

MIT
