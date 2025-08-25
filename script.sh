#!/bin/bash

# Remove the local manifests directory if it exists (cleanup before repo initialization)
rm -rf .repo/local_manifests/
rm -rf prebuilts/clang/host/linux-x86

# Initialize ROM manifest
repo init -u https://github.com/AxionAOSP/android.git -b lineage-23.0 --git-lfs

# Sync the repo with force to ensure a clean sync
/opt/crave/resync.sh

# Set up th build environment
. build/envsetup.sh

# Choose the target device
axion mojito va

# keys
gk -s

# Build the ROM (use mka bacon for a full build)
brunch mojito userdebug