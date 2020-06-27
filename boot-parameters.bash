#!/bin/bash

set -e

# Full list of core Linux kernel parameters:
# https://www.kernel.org/doc/html/latest/admin-guide/kernel-parameters.html
# Full list of amdgpu driver kernel parameters:
# https://www.kernel.org/doc/html/latest/gpu/amdgpu.html

parameters=(
    "amdgpu.dc=1"
    "amdgpu.dpm=-1"
    "amdgpu.gpu_recovery=0"
    "amdgpu.ppfeaturemask=0xffffffff"
    "amdgpu.vm_debug=1"
    "amdgpu.vm_fault_stop=2"
    "amdgpu.vm_update_mode=0"
    "pcie_aspm=off"
)

usage()
{
    cat <<EOF
Usage: boot-parameters.bash [command]

Where [command] is one of:
  add
  remove

Adds or removes gpu-related boot parameters, using kernelstub.

EOF
}

if [[ "$1" == "add" ]]; then
    for parameter in "${parameters[@]}"; do
        sudo kernelstub -a "$parameter"
    done
elif [[ "$1" == "remove" ]]; then
    for parameter in "${parameters[@]}"; do
        sudo kernelstub -d "$parameter"
    done
else
    usage
fi
