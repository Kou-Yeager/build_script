#!/bin/bash

# Remove the local manifests directory if it exists (cleanup before repo initialization)
rm -rf .repo/local_manifests/

# remove device tree
rm -rf device/xiaomi/mojito
rm -rf kernel/xiaomi/mojito
rm -rf vendor/xiaomi/mojito

# Initialize ROM manifest
repo init -u https://github.com/Project-Mist-OS/manifest -b 15 --git-lfs

# Sync the repo with force to ensure a clean sync
/opt/crave/resync.sh

# remove build/song
rm -rf build/song

# cloning device tree
git clone https://github.com/Kou-Yeager/android_device_xiaomi_mojito.git --depth 1 -b lineage-22 device/xiaomi/mojito

# cloning kernel tree
git clone https://github.com/pyo3377/kxm --depth 1 -b inline-rom kernel/xiaomi/mojito

# cloning vendor tree
git clone https://github.com/Kou-Yeager/android_vendor_xiaomi_mojito.git --depth 1 -b lineage-22 vendor/xiaomi/mojito

# add build/song new
git clone https://github.com/Kou-Yeager/build_soong.git --depth 1 -b 15 build/song

# Set up th build environment
. build/envsetup.sh

# Choose the target device
mistify mojito userdebug

# Build the ROM (use mka bacon for a full build)
mist b
