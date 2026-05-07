#!/bin/sh
#SBATCH --job-name=inference
#SBATCH --nodes=1
#SBATCH --gpus=1
#SBATCH --output=/code/table-sft/slurm_logs/general_inference/%x-%j.log

llamafactory-cli eval /code/table-sft/saves/mistral-finetune/experiment-12004-mistral-lr-5.0e-7-tablellama_train/checkpoint-18060/evaluations/mmlu-pro/experiment-mmlu-pro.yaml
