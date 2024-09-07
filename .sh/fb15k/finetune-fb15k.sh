#!/bin/bash
#SBATCH --workdir=/home/tacucumides/storage
#SBATCH --ntasks=1
#SBATCH --job-name=train-unr-fb15k
#SBATCH --nodelist=hydra
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=tacucumides@uc.cl
#SBATCH --output=/home/tacucumides/storage/GNN-QE/logs/experiments/fb15k/%A.log
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
python script/run.py -c config/fb15k-finetune.yaml --gpus [0] --checkpoint ../2023-09-25-20-59-06/model_epoch_8.pth
