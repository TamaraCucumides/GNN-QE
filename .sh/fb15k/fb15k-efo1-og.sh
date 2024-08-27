#!/bin/bash
#SBATCH --chdir=/home/tacucumides/storage
#SBATCH --ntasks=1
#SBATCH --job-name=gnnqe-log-efo1
#SBATCH --nodelist=yodaxico
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=tacucumides@uc.cl
#SBATCH --output=/home/tacucumides/storage/GNN-QE/logs/experiments/efo1/%A.log
#SBATCH --gres=gpu:1
#SBATCH --cpus-per-gpu=2
#SBATCH --partition=ialab-high
pwd; hostname; date
echo "Start"
echo $(pwd)
cd /home/tacucumides/storage
source miniconda3/etc/profile.d/conda.sh
conda activate nbfnet
cd /home/tacucumides/storage/GNN-QE
python script/test.py -c config/fb15k-efo1.yaml --checkpoint ../2023-09-23-11-55-04/model_epoch_10.pth --gpus [0]
