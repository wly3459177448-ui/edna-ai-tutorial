#!/bin/bash
set -euo pipefail
echo "========================================"
echo "   eDNA项目环境启动"
echo "========================================"
bash 01_fetch/fetch_open.sh
snakemake -s 02_qc_asv/Snakefile --cores 4
echo ">>> Week1 PASSED ✔"
