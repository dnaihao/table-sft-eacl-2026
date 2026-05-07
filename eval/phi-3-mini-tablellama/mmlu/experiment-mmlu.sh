#!/bin/sh
#SBATCH --job-name=inference
#SBATCH --nodes=1
#SBATCH --gpus=1
#SBATCH --output=/code/table-sft/slurm_logs/-code-table-sft-saves-phi-mini-finetune-experiment-12000-phi-lr-5.0e-7-tablellama_train-checkpoint-18060-mmlu-%x-%j.log

llamafactory-cli eval /code/table-sft/saves/phi-mini-finetune/experiment-12000-phi-lr-5.0e-7-tablellama_train/checkpoint-18060/evaluations/mmlu/experiment-mmlu.yaml
