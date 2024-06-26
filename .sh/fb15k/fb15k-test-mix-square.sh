#!/bin/bash
#SBATCH --workdir=/home/tacucumides/storage
#SBATCH --ntasks=1
#SBATCH --job-name=fb15k-test-square-nips
#SBATCH --nodelist=yodaxico
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=tacucumides@uc.cl
#SBATCH --output=/home/tacucumides/storage/GNN-QE/logs/experiments/%A.log
#SBATCH --gres=gpu:1
#SBATCH --cpus=1
#SBATCH --partition=ialab-high
pwd; hostname; date
echo "Start"
echo $(pwd)
cd /home/tacucumides/storage
source miniconda3/etc/profile.d/conda.sh
conda activate nbfnet
cd /home/tacucumides/storage/GNN-QE
python script/test.py -c config/fb15k-test-square.yaml --checkpoint ../2023-09-25-20-59-06/model_epoch_9.pth --gpus [0]
