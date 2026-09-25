#!/bin/bash

# Slurm job options (job-name, job time)
#SBATCH --job-name=build_cce
#SBATCH --time=12:20:0
#SBATCH --ntasks=12
#SBATCH --partition=standard
#SBATCH --qos=standard

#module purge
cd $SLURM_SUBMIT_DIR

export SPACK_USER_CONFIG_PATH="${PWD}/.spack"
export SPACK_USER_CACHE_PATH="${PWD}/.spack/cache"
export OMP_NUM_THREADS=1

. spack/share/spack/setup-env.sh

module load PrgEnv-cray

spack env activate .
spack repo add mo-spack-packages/spack_repo/metoffice
#spack clean --all
spack concretize -f

#spack debug report

spack install
#spack env view regenerate
