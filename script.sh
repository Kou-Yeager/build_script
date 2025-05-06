#!/bin/bash

# Remove the local manifests directory if it exists (cleanup before repo initialization)
rm -rf .repo/local_manifests/

# Initialize ROM manifest
repo init -u https://github.com/AxionAOSP/android.git -b lineage-22.2 --git-lfs

# Sync the repo with force to ensure a clean sync
/opt/crave/resync.sh

# remove frameworks/native
rm -rf frameworks/native

# add frameworks/native
git clone https://github.com/zeydann/frameworks_native-axion.git -b 15 frameworks/native

# Set up th build environment
. build/envsetup.sh

# Choose the target device
axion mojito va

# full target
brunch mojito userdebug