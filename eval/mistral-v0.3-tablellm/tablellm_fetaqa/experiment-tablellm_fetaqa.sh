#!/bin/sh
#SBATCH --job-name=inference
#SBATCH --nodes=1
#SBATCH --gpus=2
#SBATCH --output=/code/table-sft/slurm_logs/%x-%j.log

llamafactory-cli train /code/table-sft/saves/mistral-finetune/experiment-11000-mistral-lr-5.0e-7-tablellm_train/checkpoint-13602/evaluations/tablellm_fetaqa/experiment-tablellm_fetaqa.yaml
