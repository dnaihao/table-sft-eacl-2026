---
name: paper-cleanup
description: Find unreferenced figures, unused bib entries, and orphan labels in paper/main.tex so the user can prune them. Reports findings first; never deletes without confirmation.
---

# paper-cleanup

Audit `paper/main.tex` against `paper/imgs/`, `paper/figures/`, `paper/tables/`, and `paper/custom.bib` (+ `paper/aclanthology.bib` if non-empty). Produce a concise report of what is unused, then wait for the user to confirm before deleting anything.

## What to check

Run these checks in parallel where possible — they are independent.

### 1. Unreferenced image / figure files

For every file under `paper/imgs/**/*` and `paper/figures/**/*` (typical extensions: `.pdf`, `.png`, `.jpg`, `.jpeg`, `.eps`, `.svg`), check whether its basename (with and without extension) appears inside any `\includegraphics[...]{...}` call in `paper/main.tex`. LaTeX `\includegraphics` paths are commonly written without an extension, so match both `imgs/foo.pdf` and `imgs/foo`.

Report any file in `imgs/` or `figures/` that is not referenced.

### 2. Unused bib entries

Parse `@type{key, ...}` entry keys from `paper/custom.bib` (and `paper/aclanthology.bib` if it has content — it was empty at last check; skip if zero bytes).

For each key, check whether it appears inside any citation command in `paper/main.tex`: `\cite{...}`, `\citet{...}`, `\citep{...}`, `\citeauthor{...}`, `\citeyear{...}`, `\citealp{...}`, `\citealt{...}`, `\nocite{...}`. Keys can appear comma-separated inside one command (`\citep{a,b,c}`) — split on comma and trim whitespace before comparing.

Report any bib key that is never cited.

### 3. Duplicate bib entries

Report any bib key that appears more than once across `custom.bib` and `aclanthology.bib`.

### 4. Orphan labels

For every `\label{...}` in `main.tex`, check whether the label is referenced by `\ref{}`, `\eqref{}`, `\autoref{}`, `\cref{}`, `\Cref{}`, `\pageref{}`, `\nameref{}`, or `\hyperref[...]{}`.

Report unreferenced labels — but be aware some labels are intentional anchors and the user may keep them. Present them as a list to review, not a delete list.

## Output format

Print four sections (omit a section if it has zero hits):

```
## Unreferenced figures (N)
- imgs/foo.pdf
- figures/bar.png
...

## Unused bib entries (N)
- smith2020something  (custom.bib:1234)
- jones2019other      (custom.bib:5678)
...

## Duplicate bib entries (N)
- doe2021paper        (custom.bib:100, aclanthology.bib:42)
...

## Orphan labels (N)
- fig:overview        (main.tex:567)
...
```

Then summarize: "X files / Y bib entries / Z labels can likely be removed. Want me to delete them?"

## After confirmation

Only after the user says yes (and ideally identifies which categories to act on — they may want to keep some orphan labels):

- Delete unreferenced image files with `git rm` so the deletion is staged.
- For bib entries: rewrite `custom.bib` (and `aclanthology.bib` if applicable) with the unused entries removed. Preserve the surrounding formatting — bib files are human-edited.
- For duplicate bib entries: keep one, remove the other(s). If they differ in fields, show the user the diff and ask which to keep.
- Do not delete orphan labels automatically — they may be intentional. Ask per-label or batch by user instruction.

Do not commit. Stage the changes and let the user review with `git diff --cached` before committing.

## Notes

- `paper/main.tex` is large (~185 KB at last check). Read it once into memory; do not re-read for each check.
- `aclanthology.bib` may be empty (zero bytes) — handle that without crashing.
- Some `\includegraphics` calls use macros or `\input` indirection — if you find any, surface them rather than guessing. Better to under-report unused files than to recommend deleting one that's referenced indirectly.
- Image references can include subdirectories (e.g., `\includegraphics{imgs/diagrams/foo}`) — match on the full path inside `imgs/` and `figures/`, not just the basename, when paths are nested.
