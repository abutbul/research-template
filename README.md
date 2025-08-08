# Research Paper Template with Quarto and Slidev

A comprehensive template for academic research papers with integrated presentation slides and blog posts. This template provides a structured approach to creating and publishing research work using modern tools.

## Features

- 📝 **Quarto-based Research Paper**: Complete academic paper structure with IEEE citation style
- 🎭 **Slidev Presentations**: Modern, interactive slides with animations and layouts
- 📱 **Blog Posts**: Ready-to-use templates for research blog posts
- 🚀 **Release Automation**: Scripts for versioning and publishing

## Structure

```plaintext
research-template/
├── research_paper/     # Quarto-based paper
│   ├── chapters/       # Paper sections
│   ├── _quarto.yml    # Quarto configuration
│   ├── references.bib # Bibliography
│   └── ieee.csl      # Citation style
├── slidev/           # Presentation slides
│   ├── layouts/      # Custom slide layouts
│   └── slides/       # Slide content
└── blog_posts/       # Research blog posts
```

## Quick Start

1. **Setup Paper**:

   ```bash
   cd research_paper
   quarto preview
   ```

2. **Preview Slides**:

   ```bash
   cd slidev
   npm install
   npm run dev
   ```

3. **Create Release**:

   ```bash
   ./release.sh v1.0.0
   ```

## Requirements

- [Quarto](https://quarto.org/) for paper generation
- [Node.js](https://nodejs.org/) for Slidev presentations
- [Git](https://git-scm.com/) for version control

## Versioning

This template follows [Semantic Versioning](https://semver.org/):

- MAJOR version for significant template changes
- MINOR version for new features
- PATCH version for bug fixes

## Contributing

Feel free to submit issues and enhancement requests. PRs are welcome!

## License

MIT License - see LICENSE file for details.

---

**📚 Template Usage**: Replace placeholder content in `research_paper/`, `slidev/slides/`, and `blog_posts/` with your research content.
