#!/bin/sh
#SBATCH --job-name=inference
#SBATCH --nodes=1
#SBATCH --gpus=1
#SBATCH --output=/code/table-sft/slurm_logs/%x-%j.log

llamafactory-cli train /code/table-sft/saves/mistral-finetune/experiment-2109-mistral-lr-5.0e-7-tablegpt_small/checkpoint-1116/evaluations/Spreadsheets_ED_Real_test/experiment-Spreadsheets_ED_Real_test.yaml
