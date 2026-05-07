#!/bin/sh
#SBATCH --job-name=inference
#SBATCH --nodes=1
#SBATCH --gpus=1
#SBATCH --output=/code/table-sft/slurm_logs/%x-%j.log

llamafactory-cli train /code/table-sft/saves/olmo-finetune/experiment-12004-olmo-lr-5.0e-7-tablellm_train/checkpoint-13602/evaluations/Spreadsheets_ED_Real_test/experiment-Spreadsheets_ED_Real_test.yaml
