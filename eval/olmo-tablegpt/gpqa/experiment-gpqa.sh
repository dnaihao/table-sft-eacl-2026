#!/bin/sh
#SBATCH --job-name=inference
#SBATCH --nodes=1
#SBATCH --gpus=1
#SBATCH --output=/code/table-sft/slurm_logs/olmo_general_inference/%x-%j.log

llamafactory-cli eval /code/table-sft/saves/olmo-finetune/experiment-12004-olmo-lr-5.0e-7-tablegpt_large_train/checkpoint-11178/evaluations/gpqa/experiment-gpqa.yaml
