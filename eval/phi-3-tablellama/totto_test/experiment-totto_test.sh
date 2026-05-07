#!/bin/sh
#SBATCH --job-name=inference
#SBATCH --nodes=1
#SBATCH --gpus=1
#SBATCH --output=/code/table-sft/slurm_logs/-code-table-sft-saves-phi-finetune-experiment-12000-phi-lr-5.0e-7-tablellama_train-checkpoint-18060-totto_test-%x-%j.log

llamafactory-cli train /code/table-sft/saves/phi-finetune/experiment-12000-phi-lr-5.0e-7-tablellama_train/checkpoint-18060/evaluations/totto_test/experiment-totto_test.yaml
