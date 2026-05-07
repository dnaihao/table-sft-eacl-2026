#!/bin/sh
#SBATCH --job-name=inference
#SBATCH --nodes=1
#SBATCH --gpus=2
#SBATCH --output=/code/table-sft/slurm_logs/%x-%j.log
#SBATCH --dependency=afterany:10082:10083:10084:10085:10086:10087:10088

llamafactory-cli train /code/table-sft/saves/mistral-finetune/experiment-2118-mistral-lr-5.0e-7-tablegpt_large/checkpoint-5589/evaluations/tabfact_test/experiment-tabfact_test.yaml
