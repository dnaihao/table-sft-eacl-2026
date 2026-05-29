# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

See `README.md` for the project overview, layout, and released artefacts.

## Repo is archival

This is the public companion repository for an EACL 2026 Findings paper, not an active development codebase. There is no Python source, no package manifest, no test suite, and no formatter configured. Most directories are frozen snapshots.

## Do not execute eval scripts

Every file under `eval/**/experiment-*.sh` is a SLURM launcher that references cluster paths like `/code/table-sft/saves/...` which no longer exist. They are preserved as a record of how each result was produced. Do not run them, and do not "fix" the dead paths — they are intentionally left as-is.

## Raw model outputs live on HuggingFace

The parsed metrics in `eval/**/all_results.json` are checked in, but the raw `generated_predictions.jsonl` files (~1.8 GB total) are not. They are published as the dataset `dnaihao/table-sft-eval-predictions` on HuggingFace: <https://huggingface.co/datasets/dnaihao/table-sft-eval-predictions>. If a task needs raw predictions, fetch them from there rather than expecting them locally.

## Paper

`paper/` is the LaTeX source for the camera-ready. **Do not build the PDF** — the user does not want it built from this repo; the published version is on ACL Anthology.

Common paper task: removing unreferenced figures and unused bib entries (see the recent `paper-cleanup` history). The `/paper-cleanup` skill handles this — prefer it over ad-hoc grepping.

## Docs site

`docs/` is an Astro project. The source lives in this repo (entrypoint `docs/src/pages/index.astro`, layout in `docs/src/layouts/Layout.astro`, results data in `docs/src/data/results.json`). The site deploys to GitHub Pages via `.github/workflows/deploy-pages.yml` on push to `main` when `docs/**` changes — do not check in build output (`docs/dist/`, `docs/node_modules/`, `docs/.astro/` are already gitignored).
