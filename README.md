Aim

Want fast mpi c++/fortran with standard stack and optimized mpi etc
Also want python such as psyclone
Do not particularly want to run models through a python interface

Initally, make spack env then make venv for python (not conda as lustre etc)

Python should be for compile time or non-performant bits. Pip install might not use the fast MPI etc?

Make a dir for each HPC with spack.yaml and requirements.txt, plus readme

Making the environments

Install spack, activate from yaml, concretize, install...

pip install --upgrade pip setuptools wheel
pip install -r requirements.txt
pip install -r requirements.txt (note try to keep compute stuff out of python in these envs; do something clever here if need to build fast binaries)

Usage

spack env activate ...
source .venv/bin/activate

Always spack first then python
