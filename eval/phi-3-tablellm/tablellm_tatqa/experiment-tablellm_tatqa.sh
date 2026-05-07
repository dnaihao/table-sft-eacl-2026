#!/bin/sh
#SBATCH --job-name=inference
#SBATCH --nodes=1
#SBATCH --gpus=1
#SBATCH --output=/code/table-sft/slurm_logs/-code-table-sft-saves-phi-finetune-experiment-12001-phi-lr-5.0e-7-tablellm_train-checkpoint-13602-tablellm_tatqa-%x-%j.log

llamafactory-cli train /code/table-sft/saves/phi-finetune/experiment-12001-phi-lr-5.0e-7-tablellm_train/checkpoint-13602/evaluations/tablellm_tatqa/experiment-tablellm_tatqa.yaml
