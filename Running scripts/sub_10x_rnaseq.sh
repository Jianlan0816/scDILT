#!/bin/bash -l
#SBATCH -J scDLT1
#SBATCH --gres=gpu:1
#SBATCH --mem=40G

module purge
#conda activate ~/miniconda3_1/envs/torch_py38
conda activate mypython3 
f=~/Source_data/granulocyte.h5
l=~/Source_data/granulocyte_anchor.xlsx
echo "Final e18"
 for i in {1..1}
 do
    python -u run_scDILT.py --landmark_file $l --weight_ml 0.5 \
    --weight_cl 1.5 --n_ml1 0 --n_ml2 8000 --n_cl 0 --n_clusters 14 \
    --ae_weight_file AE_weights_s1.pth.tar --data_file $f --dir_name granulocyte --run $i
 done
