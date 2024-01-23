#!/bin/bash
#SBATCH --workdir=/home/tacucumides/storage
#SBATCH --ntasks=1
#SBATCH --job-name=nell-mixed-train-v2
#SBATCH --nodelist=scylla
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=tacucumides@uc.cl
#SBATCH --output=/home/tacucumides/storage/GNN-QE/logs/experiments/fb15k/%A.log
#SBATCH --gres=gpu:TitanRTX:1
#SBATCH --cpus=6
#SBATCH --partition=ialab-high

pwd; hostname; date
echo "Start"
echo $(pwd)
cd /home/tacucumides/
source miniconda3/etc/profile.d/conda.sh
conda activate gnn-qe
cd /home/tacucumides/storage/GNN-QE
python script/run.py -c config/nell-fulltrain.yaml --gpus [0]
