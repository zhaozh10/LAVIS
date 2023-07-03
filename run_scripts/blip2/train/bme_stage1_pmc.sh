#!/usr/bin/env bash
#SBATCH -p bme_gpu
#SBATCH --job-name=blip2_pmc
#SBATCH --nodes=1
#SBATCH --gres=gpu:4
#SBATCH --ntasks-per-node=4
#SBATCH --cpus-per-task=2
#SBATCH -t 5-00:00:00

set -x
source activate lavis

CONFIG=$1
PY_ARGS=${@:2}

nvidia-smi

PYTHONPATH="$(dirname $0)/..":$PYTHONPATH \
python -u train.py --cfg-path ${CONFIG}  ${PY_ARGS}