# iana-atanassova.github.io

Source of the personal academic website of **Iana Atanassova**, Full Professor of Natural Language Processing at Université Marie et Louis Pasteur (CRIT), Besançon, France.

**Website:** https://iana-atanassova.github.io

## Stack

- [Jekyll](https://jekyllrb.com/) with the [al-folio](https://github.com/alshedivat/al-folio) theme (MIT licence, see `LICENSE`)
- [jekyll-scholar](https://github.com/inukshuk/jekyll-scholar) for the publication list
- LaTeX / biblatex for the PDF CV (`CV-latex/`)
- Deployment: GitHub Actions → GitHub Pages on every push to `main`

## Repository layout

| Path | Content |
|---|---|
| `_pages/` | Site pages (about, publications, projects, CV, outreach, news) |
| `_news/` | News items |
| `_projects/`, `_outreach/` | Project and outreach cards |
| `CV-latex/` | CV sources (`content.tex`, bilingual FR/EN) and master bibliography (`iana-all.bib`) |
| `_bibliography/` | Bibliography used by the website — **generated** from `CV-latex/iana-all.bib` |
| `assets/` | Images and PDFs (including the CV PDFs) |

## Updating the site

See [`HELP_modifs.md`](HELP_modifs.md) (in French) for step-by-step instructions.

Quick version:

```bash
# 1. edit CV-latex/iana-all.bib, CV-latex/content.tex, _news/, _projects/ ...
# 2. rebuild CV PDFs and the web bibliography
cd CV-latex && ./compile.sh && cd ..
# 3. optional local preview
bundle exec jekyll serve
# 4. publish
git add -A && git commit -m "Update: ..." && git push
```
