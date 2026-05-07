#!/bin/sh
#SBATCH --job-name=inference
#SBATCH --nodes=1
#SBATCH --gpus=2
#SBATCH --output=/code/table-sft/slurm_logs/%x-%j.log

llamafactory-cli train /code/table-sft/saves/olmo-finetune/experiment-12004-olmo-lr-5.0e-7-tablegpt_large_train/checkpoint-11178/evaluations/Spreadsheets_CF_test/experiment-Spreadsheets_CF_test.yaml
