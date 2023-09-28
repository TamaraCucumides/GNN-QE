#!/bin/bash
#SBATCH --workdir=/home/tacucumides/storage
#SBATCH --ntasks=1
#SBATCH --job-name=nell-test-sa
#SBATCH --nodelist=scylla
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=tacucumides@uc.cl
#SBATCH --output=/home/tacucumides/storage/GNN-QE/logs/experiments/nell/%A.log
#SBATCH --gres=gpu:TitanRTX:1
#SBATCH --cpus=4
#SBATCH --partition=ialab-high
pwd; hostname; date
echo "Start"
echo $(pwd)
cd /home/tacucumides/
source miniconda3/etc/profile.d/conda.sh
conda activate gnn-qe
cd /home/tacucumides/storage/GNN-QE
python script/test.py -c config/nell-test-tri.yaml --checkpoint ../2023-09-26-22-59-00/model_epoch_8.pth --gpus [0]
