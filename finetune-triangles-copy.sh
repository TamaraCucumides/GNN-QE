#!/bin/bash
#SBATCH --workdir=/home/tacucumides/storage
#SBATCH --ntasks=1
#SBATCH --job-name=gnn-qe
#SBATCH --nodelist=hydra
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=tacucumides@uc.cl
#SBATCH --output=/home/tacucumides/storage/GNN-QE/logs/experiments/%A.log
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
python script/run.py -c config/finetune-triangles.yaml --gpus [0] --checkpoint ../2023-09-20-15-00-26/model_epoch_3.pth
