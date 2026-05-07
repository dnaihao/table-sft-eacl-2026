#!/bin/sh
#SBATCH --job-name=inference
#SBATCH --nodes=1
#SBATCH --gpus=1
#SBATCH --output=/code/table-sft/slurm_logs/-code-table-sft-saves-phi-mini-finetune-experiment-12000-phi-lr-5.0e-7-tablellama_train-checkpoint-18060-wikitq_test-%x-%j.log

llamafactory-cli train /code/table-sft/saves/phi-mini-finetune/experiment-12000-phi-lr-5.0e-7-tablellama_train/checkpoint-18060/evaluations/wikitq_test/experiment-wikitq_test.yaml
