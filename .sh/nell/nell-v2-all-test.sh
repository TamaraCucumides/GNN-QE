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
echo "Test original"
python script/test.py -c config/nell-test-og.yaml --checkpoint ../2023-09-27-23-50-24/model_epoch_9.pth --gpus [0]
echo "Test sin anchor"
python script/test.py -c config/nell-test-SA.yaml --checkpoint ../2023-09-27-23-50-24/model_epoch_9.pth --gpus [0]
echo "Test ciclicos"
python script/test.py -c config/nell-test-last.yaml --checkpoint ../2023-09-27-23-50-24/model_epoch_9.pth --gpus [0]
