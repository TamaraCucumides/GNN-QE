#!/bin/bash
#SBATCH --workdir=/home/tacucumides/storage
#SBATCH --ntasks=1
#SBATCH --job-name=tri-gnn-qe
#SBATCH --nodelist=yodaxico
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=tacucumides@uc.cl
#SBATCH --output=/home/tacucumides/storage/GNN-QE/logs/experiments/%A.log
#SBATCH --gres=gpu:1
#SBATCH --cpus=2
#SBATCH --partition=ialab-high

pwd; hostname; date
echo "Start"
echo $(pwd)
cd /home/tacucumides/
source miniconda3/etc/profile.d/conda.sh
conda activate gnn-qe
cd /home/tacucumides/storage/GNN-QE
python script/test.py -c config/fb237-100.yaml --checkpoint ../2023-09-21-14-36-32/model_epoch_8.pth --gpus [0]
