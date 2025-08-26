#!/bin/bash

# Remove the local manifests directory if it exists (cleanup before repo initialization)
rm -rf .repo/local_manifests/
rm -rf prebuilts/clang/host/linux-x86

# Initialize ROM manifest
repo init -u https://github.com/ProjectMatrixx/android.git -b 15.0 --git-lfs

# Sync the repo with force to ensure a clean sync
/opt/crave/resync.sh

# remove frameworks/native
rm -rf frameworks/native

# add modify
git clone https://github.com/Zeydann/android_frameworks_native-matrix.git -b 15 frameworks/native

# leica
#git clone --depth=1 https://gitlab.com/romgharti/android_vendor_xiaomi_mojito-leicacamera.git -b main vendor/xiaomi/mojito-leicacamera

# Set up th build environment
. build/envsetup.sh

# full target
brunch mojito user