#!/bin/sh
#SBATCH --job-name=inference
#SBATCH --nodes=1
#SBATCH --gpus=1
#SBATCH --output=/code/table-sft/slurm_logs/-code-table-sft-saves-phi-mini-finetune-experiment-12000-phi-lr-5.0e-7-tablegpt_large_train-checkpoint-11178-Spreadsheets_ED_Real_test-%x-%j.log

llamafactory-cli train /code/table-sft/saves/phi-mini-finetune/experiment-12000-phi-lr-5.0e-7-tablegpt_large_train/checkpoint-11178/evaluations/Spreadsheets_ED_Real_test/experiment-Spreadsheets_ED_Real_test.yaml
