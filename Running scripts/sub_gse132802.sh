#!/bin/bash -l
#SBATCH -J scDLT1
#SBATCH -p zhiwei
#SBATCH --gres=gpu:1
#SBATCH --mem=40G

module purge
#conda activate /home/x/xl456/miniconda3_1/envs/torch_py38
conda activate mypython3 
f=/home/j/jr689/scDLT/samples/ATAC_mousebrain/GSE132802_4batches_new.h5
l=/home/j/jr689/scDLT/samples/ATAC_mousebrain/GSE132802_anchor.xlsx
echo "Final e18"
 for i in {1..1}
 do
    python -u run_scDLT_4batches_anchors.py --landmark_file $l --weight_ml 0.5 --weight_cl 1.5 --n_ml1 3000 --n_ml2 0 --n_cl 5000 --n_clusters 14 --ae_weight_file AE_weights_s1.pth.tar --data_file $f --dir_name 4batches_result --run $i
 done
