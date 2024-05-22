#!/bin/bash
#SBATCH --workdir=/home/tacucumides/storage
#SBATCH --ntasks=1
#SBATCH --job-name=gnnqe-nips-triangle-nell
#SBATCH --nodelist=hydra
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=tacucumides@uc.cl
#SBATCH --output=/home/tacucumides/storage/GNN-QE/logs/experiments/%A.log
#SBATCH --gres=gpu:1
#SBATCH --cpus=2
#SBATCH --partition=ialab-high
pwd; hostname; date
echo "Start"
echo $(pwd)
cd /home/tacucumides/storage
source miniconda3/etc/profile.d/conda.sh
conda activate nbfnet
cd /home/tacucumides/storage/GNN-QE
python script/test.py -c config/nell-test-tri.yaml --checkpoint ../2023-09-26-22-59-00/model_epoch_8.pth --gpus [0]
