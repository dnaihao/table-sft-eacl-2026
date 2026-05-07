#!/bin/sh
#SBATCH --job-name=inference
#SBATCH --nodes=1
#SBATCH --gpus=1
#SBATCH --output=/code/table-sft/slurm_logs/general_inference/%x-%j.log

llamafactory-cli eval /code/table-sft/saves/mistral-finetune/experiment-2118-mistral-lr-5.0e-7-tablegpt_large/checkpoint-5589/evaluations/ai2arc/experiment-ai2arc.yaml
