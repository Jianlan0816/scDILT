#!/bin/bash -l
#SBATCH -J scDLT
#SBATCH -p zhiwei
#SBATCH --gres=gpu:1
#SBATCH --mem=40G

module purge
#conda activate /home/x/xl456/miniconda3_1/envs/torch_py38
conda activate mypython3 
f=/home/j/jr689/scDLT/samples/ATAC_mousebrain/GSE126074_count_2batches.h5
l=/home/j/jr689/scDLT/samples/ATAC_mousebrain/GSE126074_count_2batches_anchor.xlsx
echo "Final e18"
 for i in {1..1}
 do
    python -u run_scDLT_GSE126074.py --landmark_file $l --weight_ml 0.5 --weight_cl 1.5 --n_ml1 1000 --n_ml2 2000 --n_cl 9000 --n_clusters 22 --ae_weight_file AE_weights_s1.pth.tar --data_file $f --dir_name GSE126074_4 --run $i
 done
