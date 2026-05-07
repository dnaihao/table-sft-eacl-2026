# Evaluation Scripts and Metrics

This directory contains the [LLaMA-Factory](https://github.com/hiyouga/LLaMA-Factory)
inference / eval configurations and the parsed metric outputs for every
{base model} × {training dataset} × {benchmark} combination reported in the
paper. It is a sanitised re-export of the private
[`dnaihao/table-sft-eval`](https://github.com/dnaihao/table-sft-eval) repo.

## Layout

```
eval/
└── {base-model}-{train-dataset}/        # 17 dirs, e.g. mistral-v0.3-tablellm
    └── {benchmark}/                     # 8–25 subdirs per model
        ├── experiment-{benchmark}.sh    # Slurm launcher
        ├── experiment-{benchmark}.yaml  # llamafactory-cli config
        ├── all_results.json             # parsed metrics (where applicable)
        └── predict_results.json
```

The 17 directories cover three 7B base models — Mistral-v0.3, OLMo-7B, Phi-3
small — plus Phi-3-mini (4B) at the small scale, each fine-tuned on the four
training datasets (TableLlama, TableLLM, TableBench, TableGPT). One additional
small-corpus baseline `mistral-v0.3-tablegpt-small` is included.

The 25 benchmarks fall into a few groups:

| Group | Benchmarks |
|---|---|
| Real-world table understanding (in-domain) | `fetaqa_test`, `hitab_test`, `tabfact_test`, `tabmwp_test`, `tatqa_test`, `totto_test`, `wikitq_test`, `infotabs_test` |
| Synthetic / spreadsheets | `Beer_test`, `DeepM_test`, `Efthymiou_test`, `Spreadsheets_CF_test`, `Spreadsheets_DI_test`, `Spreadsheets_ED_Real_test`, `Spreadsheets_MVI_ColumnNoSep_test` |
| TableLLM-specific | `tablellm_fetaqa`, `tablellm_ottqa`, `tablellm_tatqa`, `tablellm_wtq`, `tablebench_test` |
| General capability | `ai2arc`, `gpqa`, `mmlu`, `mmlu-pro`, `instruction_following_test` |

The four general-capability dirs (`ai2arc`, `gpqa`, `mmlu`, `mmlu-pro`) only
hold the `.sh` and `.yaml`: those evals use `llamafactory-cli eval` mode and
its outputs were captured separately, not as the per-benchmark JSONs.

## Sanitisation

- `#SBATCH --mail-user=…` and `#SBATCH --mail-type=ALL` lines were stripped
  from every `.sh`. No other personal info was present.
- The YAML `model_name_or_path`, `task_dir`, and `save_dir` paths still point
  at the original cluster (`/code/table-sft/saves/{base}-finetune/…`). They are
  preserved as historical context — to reproduce, replace those paths with
  your own checkpoint and dataset locations.

## What's missing here

These are intentionally not in this repo:

- `generated_predictions.jsonl` — raw model outputs (~1.8 GB). Released
  separately as the HuggingFace dataset
  [`dnaihao/table-sft-eval-predictions`](https://huggingface.co/datasets/dnaihao/table-sft-eval-predictions).
- `trainer_log.jsonl` — training-time logs (~20 MB). Available on request.
- Trained model weights — released as private model repos under
  [huggingface.co/dnaihao](https://huggingface.co/dnaihao); see the top-level
  README for the full mapping.

## Reproducing an eval

Pick one combination and run, e.g.:

```bash
cd eval/mistral-v0.3-tablellm/wikitq_test
# Edit the YAML to point at your local checkpoint + dataset
sbatch experiment-wikitq_test.sh   # or run llamafactory-cli train <yaml> directly
```
