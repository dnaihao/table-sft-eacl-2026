#!/bin/sh
#SBATCH --job-name=inference
#SBATCH --nodes=1
#SBATCH --gpus=1
#SBATCH --nodelist=queue1-st-p4d24xlarge-7
#SBATCH --output=/code/table-sft/slurm_logs/%x-%j.log

export CUDA_VISIBLE_DEVICES=1,2,3,4,5,6,7

llamafactory-cli train /code/table-sft/saves/olmo-finetune/experiment-12000-olmo-lr-5.0e-7-tablellama_train/checkpoint-18060/evaluations/fetaqa_test/experiment-fetaqa_test.yaml
