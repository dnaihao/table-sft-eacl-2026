#!/usr/bin/env python3
"""Aggregate per-{model,benchmark} parsed metrics into a single JSON file
consumed by the project page (src/data/results.json).

Reads from `../../eval/{model}/{benchmark}/predict_results.json`
and writes a list of {model, benchmark, metrics} objects to stdout.

Run:
    python3 docs/scripts/aggregate-results.py > docs/src/data/results.json
"""

import json, os, sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
EVAL = ROOT / "eval"

# Headline metric per benchmark — the one the paper highlights.
# Falls back to whatever the JSON exposes if the canonical key is missing.
CANONICAL_METRIC = {
    # Real-world table benchmarks
    "fetaqa_test":  "predict_bleu-4",
    "totto_test":   "predict_bleu-4",
    "wikitq_test":  "predict_rouge-l",
    "tabfact_test": "predict_rouge-l",
    "tatqa_test":   "predict_rouge-l",
    "tabmwp_test":  "predict_rouge-l",
    "hitab_test":   "predict_rouge-l",
    "infotabs_test": "predict_rouge-l",
    "tablebench_test": "predict_rouge-l",
    # TableLLM-specific evaluations
    "tablellm_fetaqa": "predict_bleu-4",
    "tablellm_ottqa":  "predict_rouge-l",
    "tablellm_tatqa":  "predict_rouge-l",
    "tablellm_wtq":    "predict_rouge-l",
    # Synthetic spreadsheets
    "Beer_test":       "predict_rouge-l",
    "DeepM_test":      "predict_rouge-l",
    "Efthymiou_test":  "predict_rouge-l",
    "Spreadsheets_CF_test":   "predict_rouge-l",
    "Spreadsheets_DI_test":   "predict_rouge-l",
    "Spreadsheets_ED_Real_test": "predict_rouge-l",
    "Spreadsheets_MVI_ColumnNoSep_test": "predict_rouge-l",
    "instruction_following_test": "predict_rouge-l",
}


def load_metrics(p: Path):
    if not p.is_file():
        return None
    try:
        return json.loads(p.read_text())
    except json.JSONDecodeError:
        return None


def split_model(name: str):
    """Split mistral-v0.3-tablellm into (mistral-v0.3, tablellm)."""
    for base in (
        "mistral-v0.3", "phi-3-mini", "phi-3", "olmo",
        "qwen2.5-7b", "qwen3-8b",
    ):
        if name.startswith(base + "-"):
            return base, name[len(base) + 1 :]
    return "?", name


def main() -> int:
    rows = []
    for model_dir in sorted(EVAL.iterdir()):
        if not model_dir.is_dir() or model_dir.name.startswith("."):
            continue
        if model_dir.name in {"README.md"}:
            continue
        base, train = split_model(model_dir.name)
        for bench_dir in sorted(model_dir.iterdir()):
            if not bench_dir.is_dir():
                continue
            metrics = load_metrics(bench_dir / "predict_results.json")
            if metrics is None:
                metrics = load_metrics(bench_dir / "all_results.json")
            if metrics is None:
                continue  # benchmark has no parsed results (e.g., mmlu)
            canonical = CANONICAL_METRIC.get(bench_dir.name)
            headline = metrics.get(canonical) if canonical else None
            if headline is None:
                # Pick the first numeric predict_* key if no canonical match.
                for k, v in metrics.items():
                    if k.startswith("predict_") and isinstance(v, (int, float)) and "runtime" not in k and "samples" not in k and "steps" not in k and "preparation" not in k:
                        headline, canonical = v, k
                        break
            rows.append({
                "model": model_dir.name,
                "base": base,
                "train": train,
                "benchmark": bench_dir.name,
                "metric": canonical,
                "value": headline,
                "all_metrics": {k: v for k, v in metrics.items() if "runtime" not in k and "samples" not in k and "steps" not in k and "preparation" not in k},
            })
    json.dump(rows, sys.stdout, indent=2)
    sys.stdout.write("\n")
    print(f"\n# wrote {len(rows)} rows", file=sys.stderr)
    return 0


if __name__ == "__main__":
    sys.exit(main())
