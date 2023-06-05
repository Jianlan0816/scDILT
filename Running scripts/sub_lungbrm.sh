#!/bin/bash -l
#SBATCH -J scDLT1
#SBATCH -p zhiwei
#SBATCH --gres=gpu:1
#SBATCH --mem=40G

module purge
#conda activate /home/x/xl456/miniconda3_1/envs/torch_py38
conda activate mypython3 
f=/home/j/jr689/scDLT/samples/ATAC_mousebrain/lungbrm_2batches_v6.h5
l=/home/j/jr689/scDLT/samples/ATAC_mousebrain/lungbrm_anchor.xlsx
echo "Final e18"
 for i in {1..1}
 do
    python -u run_scDLT_lungbrm.py --landmark_file $l --weight_ml 0.5 --weight_cl 1.5 --n_ml1 1500 --n_ml2 1500 --n_cl 10000 --n_clusters 37 --ae_weight_file AE_weights_s1.pth.tar --data_file $f --dir_name lungbrm --run $i
 done