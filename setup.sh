#!/bin/bash

root_dir=$(dirname $0)

if [ -d ${root_dir}/ILAMB_ROOT ]; then
    exit
fi

mkdir ${root_dir}/ILAMB_ROOT

: "${DATA:=/g/data/ct11/access-nri/replicas/ILAMB}"

ln -s ${DATA} ${root_dir}/ILAMB_ROOT/DATA

mkdir ${root_dir}/ILAMB_ROOT/MODELS

MODEL_OUTPUTS=(
    '/scratch/tm70/sb8430/cable/archive/crujra_accessN96_1h/output000/cable_out.nc'
)

for ((i=0;i<"${#MODEL_OUTPUTS[@]}";i++)); do
    mkdir -p ${root_dir}/ILAMB_ROOT/MODELS/cable_${i}
    ln -s ${MODEL_OUTPUTS[${i}]} ${root_dir}/ILAMB_ROOT/MODELS/cable_${i}
done
