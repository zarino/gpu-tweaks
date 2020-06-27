#!/bin/sh

set -e

echo "manual" > /sys/class/drm/card0/device/power_dpm_force_performance_level
echo "7" > /sys/class/drm/card0/device/pp_dpm_sclk
echo "1 2 3" > /sys/class/drm/card0/device/pp_dpm_mclk
