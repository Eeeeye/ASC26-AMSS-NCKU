#!/bin/bash
#SBATCH --job-name=AMSS_Opt
#SBATCH --nodes=1
#SBATCH --ntasks=16
#SBATCH --cpus-per-task=1
#SBATCH --output=baseline_%j.out
#SBATCH --error=baseline_%j.err

cd $SLURM_SUBMIT_DIR
export PYTHONPATH=/mnt/$USER/python_packages:$PYTHONPATH

mkdir -p /mnt/$USER/mytmp
export TMPDIR=/mnt/$USER/mytmp

echo "Job running on nodes: $SLURM_JOB_NODELIST"
echo "Current working directory: $(pwd)"

yes "continue" | python3 -u AMSS_NCKU_Program.py

rm -rf /mnt/$USER/mytmp
