#!/usr/bin/env bash

#SBATCH --job-name="snakemake_2"
#SBATCH --partition=high
#SBATCH --cpus-per-task=32
#SBATCH --nodelist=ws3
#SBATCH --mem=30G
#SBATCH --time=14-00:00:00
#SBATCH --output=slurm_sample1-32cpu_%A_%a_%j.log

source /home/main-SSD04/0.software/"python-env"/p-mahek/bin/activate

echo
dt1=$(date '+%Y/%m/%d %H:%M:%S')
echo -e "---- $dt1 ---- " | tee -a times.log

snakemake --core 32 --latency-wait 32000 all

echo; dt1=$(date '+%Y/%m/%d %H:%M:%S')
echo -e "---- $dt1 ---- " | tee -a times.log

deactivate
