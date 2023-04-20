#!/bin/bash
#
#SBATCH -J Matlab_NCgenerate
#SBATCH -o Matlab_NCgenerate.out
#SBATCH -e Matlab_NCgenerate.err
#SBATCH -p 24hour
#SBATCH --time=24:00:00 #batch job time limit
#SBATCH -N 1
#SBATCH -c 28
#SBATCH --mail-type ALL
#SBATCH --mail-user victoria.dutch@northumbria.ac.uk
#SBATCH --exclusive


module load MATLAB/R2020a

srun -n 1 -c 1 matlab -no-splash -nodesktop -r "CreateALLthefiles"
