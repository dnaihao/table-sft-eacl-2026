#!/bin/sh
#SBATCH --job-name=inference
#SBATCH --nodes=1
#SBATCH --gpus=1
#SBATCH --output=/code/table-sft/slurm_logs/-code-table-sft-saves-phi-finetune-experiment-12001-phi-lr-5.0e-7-tablellm_train-checkpoint-13602-ai2arc-%x-%j.log

llamafactory-cli eval /code/table-sft/saves/phi-finetune/experiment-12001-phi-lr-5.0e-7-tablellm_train/checkpoint-13602/evaluations/ai2arc/experiment-ai2arc.yaml
