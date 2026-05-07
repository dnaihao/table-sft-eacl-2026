#!/bin/sh
#SBATCH --job-name=inference
#SBATCH --nodes=1
#SBATCH --gpus=1
#SBATCH --output=/code/table-sft/slurm_logs/-code-table-sft-saves-phi-mini-finetune-experiment-12000-phi-lr-5.0e-7-tablellama_train-checkpoint-18060-DeepM_test-%x-%j.log

llamafactory-cli train /code/table-sft/saves/phi-mini-finetune/experiment-12000-phi-lr-5.0e-7-tablellama_train/checkpoint-18060/evaluations/DeepM_test/experiment-DeepM_test.yaml
