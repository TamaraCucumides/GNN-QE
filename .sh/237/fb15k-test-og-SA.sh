#!/bin/bash
#SBATCH --workdir=/home/tacucumides/storage
#SBATCH --ntasks=1
#SBATCH --job-name=fb15k-test-sa
#SBATCH --nodelist=hydra
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=tacucumides@uc.cl
#SBATCH --output=/home/tacucumides/storage/GNN-QE/logs/experiments/%A.log
#SBATCH --gres=gpu:TitanRTX:1
#SBATCH --cpus=8
#SBATCH --partition=ialab-high
pwd; hostname; date
echo "Start"
echo $(pwd)
cd /home/tacucumides/
source miniconda3/etc/profile.d/conda.sh
conda activate gnn-qe
cd /home/tacucumides/storage/GNN-QE
python script/test.py -c config/fb15k-test-SA.yaml --checkpoint ../2023-09-23-11-55-04/model_epoch_10.pth --gpus [0]
