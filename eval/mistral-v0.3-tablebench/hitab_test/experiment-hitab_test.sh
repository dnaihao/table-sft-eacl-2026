#!/bin/sh
#SBATCH --job-name=inference
#SBATCH --nodes=1
#SBATCH --gpus=2
#SBATCH --output=/code/table-sft/slurm_logs/mistral-7b-inference-tableqa/%x-%j.log
#SBATCH --exclude=queue1-st-p4d24xlarge-5,queue1-st-p4d24xlarge-6,queue1-st-p4d24xlarge-7,queue1-st-p4d24xlarge-8

llamafactory-cli train /code/table-sft/saves/mistral-finetune/experiment-3304-mistral-lr-5.0e-7-tablebench_tableinstruct/checkpoint-1659/evaluations/hitab_test/experiment-hitab_test.yaml
