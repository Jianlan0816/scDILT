#!/bin/bash -l
#SBATCH -J 111
#SBATCH -p zhiwei
#SBATCH --gres=gpu:1
#SBATCH --mem=40G

module purge
#conda activate /home/x/xl456/miniconda3_1/envs/torch_py38
conda activate mypython3 
f=/home/j/jr689/scDLT/samples/ATAC_mousebrain/realdata_spleen_lymph_111_v2.h5
l=/home/j/jr689/scDLT/samples/ATAC_mousebrain/realdata_spleen_lymph_111_v2_anchor.xlsx
echo "Final e18"
 for i in {1..1}
 do
    python -u run_scDLT_realspleen.py --landmark_file $l --weight_ml 0.5 --weight_cl 1.5 --n_ml1 15000 --n_ml2 3000 --n_cl 32000 --n_clusters 35 --ae_weight_file AE_weights_s1.pth.tar --data_file $f --dir_name realspleen --run $i
 done
