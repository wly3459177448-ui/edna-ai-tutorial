#!/bin/bash
# 最小 Week1：下载 828 份寒区湖泊 fastq（断点续传）
set -euo pipefail
RAW_DIR="01_fetch"; mkdir -p "$RAW_DIR"
echo ">>> 开始下载 EMP500 淡水子集（500 样本）"
for i in {00001..00500}; do
  FILE="ERRID_${i}.fastq.gz"
  URL="https://ftp.microbio.me/emp/release/emp500/fasta/$FILE"
  wget -c -q --show-progress "$URL" -P "$RAW_DIR" || true
done
echo ">>> 下载完成，文件总数：$(ls "$RAW_DIR"/*.fastq.gz 2>/dev/null | wc -l)"
