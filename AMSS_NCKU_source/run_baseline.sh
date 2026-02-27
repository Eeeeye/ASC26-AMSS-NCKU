#!/bin/bash
#SBATCH --job-name=AMSS_Base
#SBATCH --nodes=1
#SBATCH --ntasks=8               # 核心数降为 8，符合管理员配额
#SBATCH --gres=gpu:1             # 必须带上申请 1 张 GPU 的参数，否则会被队列拒收
#SBATCH --time=01:00:00          # 时间缩短到 1 小时 (手册里的标准时间)
#SBATCH --partition=gpu_partition
#SBATCH --output=base_%j.out
#SBATCH --error=base_%j.err

echo "=========================================================="
echo "Starting Compilation and Baseline Simulation at $(date)"
echo "Node: $(hostname)"
echo "=========================================================="

python3 AMSS_NCKU_Program.py

echo "=========================================================="
echo "Simulation Finished at $(date)"
echo "=========================================================="
