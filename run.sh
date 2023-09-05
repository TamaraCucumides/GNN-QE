#!/bin/bash
#SBATCH --workdir=/home/tacucumides
#SBATCH --ntasks=1
#SBATCH --job-name=gnn-qe
#SBATCH --nodelist=scylla
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=tacucumides@uc.cl
#SBATCH --output=/home/tacucumides/GNN-QE/logs/%A.log
#SBATCH --gres=gpu:1
#SBATCH --cpus=8
#SBATCH --partition=ialab-high
pwd; hostname; date
echo "Start training"
echo $(pwd)
cd /home/tacucumides/storage
source miniconda3/etc/profile.d/conda.sh
conda activate gnn-qe
cd /home/tacucumides/storage/GNN-QE
python script/run.py -c config/fb15k237.yaml --gpus [0]
 
