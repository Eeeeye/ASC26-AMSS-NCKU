#!/bin/bash
#SBATCH --job-name=AMSS_Base
#SBATCH --nodes=1
#SBATCH --ntasks=16               # 我们确定的 16 核上限
#SBATCH --cpus-per-task=1
#SBATCH --output=baseline_%j.out
#SBATCH --error=baseline_%j.err

# 🌟 专家修复：让 Slurm 自动进入你执行 sbatch 时所在的目录！
cd $SLURM_SUBMIT_DIR
export PYTHONPATH=/mnt/$USER/python_packages:$PYTHONPATH

mkdir -p /mnt/$USER/mytmp
export TMPDIR=/mnt/$USER/mytmp

echo "Job running on nodes: $SLURM_JOB_NODELIST"
echo "Current working directory: $(pwd)"

yes "continue" | python3 -u AMSS_NCKU_Program.py

rm -rf /mnt/$USER/mytmp
