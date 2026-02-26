# Claude Design Logo

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg?style=flat-square)](https://opensource.org/licenses/MIT)

A Claude Code slash command for designing complete SVG logo systems. Follows a proven methodology from discovery through multi-platform export, with optional Laravel project integration.

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

| Command                       | Description                                 |
| ----------------------------- | ------------------------------------------- |
| `/design-logo`                | Start full logo design process (Phase 1-4)  |
| `/design-logo refine`         | Refine an existing logo (Phase 2-4 only)    |
| `/design-logo icons`          | Generate icon alternatives (Phase 3)        |
| `/design-logo export`         | Export final logo to all platform sizes      |
| `/design-logo export laravel` | Export and deploy into Laravel project       |

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

### Phase 4: Multi-Platform Export

1. Auto-detects available conversion tools (`rsvg-convert`, ImageMagick, Inkscape, or Sharp)
2. Generates all platform sizes from the finalized SVG:
   - Favicons (ICO, SVG, 16/32/48px PNG)
   - Apple Touch Icons (180, 152, 120, 76px)
   - Android/PWA (192, 512px + maskable)
   - Microsoft Tiles (150, 310px)
   - OpenGraph (1200x630)
3. Generates `site.webmanifest`, `browserconfig.xml`, and HTML meta tag snippet
4. Outputs to `tinker/export/` by default

### Laravel Integration

When targeting a Laravel project (`/design-logo export laravel`):

- Auto-detects Laravel by checking for `artisan` and `composer.json`
- Deploys all icons and logos to `public/`
- Finds and updates Blade templates (favicon meta tags, application logo component)
- Handles dark/light mode logo switching in Blade
- Supports Breeze, Jetstream, and Livewire layouts
- Reports a summary of all files created, replaced, and templates updated

## Output

```text
tinker/
├── logo-{01..25}-{name}.svg              # 25 concepts
├── preview.html                           # Gallery preview
├── logo-dark.svg                          # Final wordmark (dark bg)
├── logo-light.svg                         # Final wordmark (light bg)
├── logo-icon-dark.svg                     # Final icon (dark bg)
├── logo-icon-light.svg                    # Final icon (light bg)
├── logo-preview.html                      # Comprehensive preview
├── icon-{a..d}-{name}-{dark|light}.svg    # Icon alternatives
├── icon-compare.html                      # Icon comparison
└── export/                                # Multi-platform export
    ├── favicon.ico
    ├── favicon.svg
    ├── favicon-{16,32,48}x*.png
    ├── apple-touch-icon*.png
    ├── android-chrome-*.png
    ├── maskable-icon-512x512.png
    ├── mstile-*.png
    ├── og-logo.png
    ├── site.webmanifest
    ├── browserconfig.xml
    └── _favicon-meta.html
```

## Prerequisites for Export

The export phase needs one SVG-to-PNG conversion tool. Install any of these:

```bash
brew install librsvg      # recommended - fastest
brew install imagemagick   # widely available
brew install inkscape      # accurate
npm install -g sharp-cli   # Node-based
```

## Design Principles

- Dark mode first (navy #0B1120 background)
- Size-aware (wordmark >= 140px, icon <= 80px)
- High contrast for legibility in both modes
- Simplicity that scales to small sizes
- Consistent brand color palette

## License

MIT
