#!/bin/bash

# Slurm job options (job-name, job time)
#SBATCH --job-name=data_analysis
#SBATCH --time=12:20:0
#SBATCH --ntasks=12
#SBATCH --account=n02-cms
#SBATCH --partition=serial
#SBATCH --qos=serial
#SBATCH --mem=48G

export OMP_NUM_THREADS=1

module purge
cd $SLURM_SUBMIT_DIR
. spack/share/spack/setup-env.sh

module load PrgEnv-gnu

spack env activate .
spack repo add mo-spack-packages/spack_repo/metoffice
#spack clean --all
spack concretize -f

#spack debug report

spack install
spack env view regenerate
