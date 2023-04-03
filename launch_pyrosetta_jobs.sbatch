#!/bin/bash

#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --time=12:00:00

module load anaconda3/2020.07
source activate /home/dk4128/.conda/envs/pyrosetta

full_palette=("026" "102" "010" "651" "303" "203" "211" "104" "004" "116" "624" "020" "120" "411" "321" "401" "305" "205" "118" "006" "602" "103" "111" "623" "406" "202" "210" "001" "101" "426" "314" "410" "601" "005" "009" "117" "007" "204" "208" "412")

##for i in ${full_palette[@]};
which python
echo ${full_palette[$SLURM_ARRAY_TASK_ID]} 
~/.conda/envs/pyrosetta/bin/python ../pmutscan.py -f ../local_refine/*.pdb -r ${full_palette[$SLURM_ARRAY_TASK_ID]}  -i 349 351 352 353 354 -m parallel --cyclize 354 349 -v
