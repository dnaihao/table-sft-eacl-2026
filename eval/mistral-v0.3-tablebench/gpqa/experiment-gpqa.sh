#!/bin/sh
#SBATCH --job-name=inference
#SBATCH --nodes=1
#SBATCH --gpus=1
#SBATCH --output=/code/table-sft/slurm_logs/general_inference/%x-%j.log

llamafactory-cli eval /code/table-sft/saves/mistral-finetune/experiment-3304-mistral-lr-5.0e-7-tablebench_tableinstruct/checkpoint-1659/evaluations/gpqa/experiment-gpqa.yaml
