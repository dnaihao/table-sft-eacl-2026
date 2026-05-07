#!/bin/sh
#SBATCH --job-name=inference
#SBATCH --nodes=1
#SBATCH --gpus=1
#SBATCH --output=/code/table-sft/slurm_logs/%x-%j.log

llamafactory-cli train /code/table-sft/saves/olmo-finetune/experiment-12000-olmo-lr-5.0e-7-tablellama_train/checkpoint-18060/evaluations/tablebench_test/experiment-tablebench_test.yaml
