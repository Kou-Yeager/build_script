#!/bin/bash

# Remove the local manifests directory if it exists (cleanup before repo initialization)
rm -rf .repo/local_manifests/

# remove device tree
rm -rf device/xiaomi/mojito
rm -rf kernel/xiaomi/mojito
rm -rf vendor/xiaomi/mojito

# Initialize ROM manifest
repo init -u https://github.com/LineageOS/android.git -b lineage-22.1 --git-lfs

# Sync the repo with force to ensure a clean sync
/opt/crave/resync.sh

# cloning device tree
git clone https://github.com/Kou-Yeager/device_xiaomi_mojito.git --depth 1 -b A15 device/xiaomi/mojito

# cloning kernel tree
git clone https://github.com/BlissRoms-Devices/kernel_xiaomi_mojito.git --depth 1 -b inline-rom kernel/xiaomi/mojito

# cloning vendor tree
git clone https://github.com/Kou-Yeager/vendor_xiaomi_mojito.git --depth 1 -b A15 vendor/xiaomi/mojito

# Set up th build environment
. build/envsetup.sh

# Choose the target device
brunch mojito userdebug
