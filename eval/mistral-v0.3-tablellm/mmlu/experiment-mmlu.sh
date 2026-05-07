#!/bin/sh
#SBATCH --job-name=inference
#SBATCH --nodes=1
#SBATCH --gpus=1
#SBATCH --output=/code/table-sft/slurm_logs/general_inference/%x-%j.log

llamafactory-cli eval /code/table-sft/saves/mistral-finetune/experiment-11000-mistral-lr-5.0e-7-tablellm_train/checkpoint-13602/evaluations/mmlu/experiment-mmlu.yaml
