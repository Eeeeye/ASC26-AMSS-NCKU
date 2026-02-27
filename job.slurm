#!/bin/bash
#SBATCH --job-name=AMSS_Base      # 作业名称
#SBATCH --nodes=1                 # 请求1个计算节点
#SBATCH --ntasks=8                # 请求8个MPI进程槽位
#SBATCH --cpus-per-task=1         # 每个MPI进程分配1个物理核心
#SBATCH --output=baseline_%j.out  # 标准输出日志
#SBATCH --error=baseline_%j.err   # 标准错误日志

cd /mnt/$USER/AMSS-NCKU-baseline

# 打印当前分配到的节点信息
echo "Job running on nodes: $SLURM_JOB_NODELIST"

# 🌟 核心破局点：使用 yes 命令无限自动回复回车，并关闭 python 的输出缓冲 (-u)
yes "continue" | python3 -u AMSS_NCKU_Program.py
