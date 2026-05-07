# Project page

Astro source for the project page deployed to GitHub Pages at
https://dnaihao.github.io/table-sft-eacl-2026/.

## Local development

```bash
cd docs
npm install
npm run dev      # serves at http://localhost:4321/table-sft-eacl-2026/
npm run build    # outputs static site to dist/
```

## Deployment

A GitHub Actions workflow at `.github/workflows/deploy-pages.yml` builds
this folder on every push to `main` and deploys the result to Pages.

## Updating the results table

The interactive results table reads from `src/data/results.json`. To
regenerate it from the parsed eval JSONs in `../eval/`:

```bash
python3 scripts/aggregate-results.py > src/data/results.json
```
