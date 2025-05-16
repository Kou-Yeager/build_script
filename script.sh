#!/bin/bash

# Remove the local manifests directory if it exists (cleanup before repo initialization)
rm -rf .repo/local_manifests/

# Initialize ROM manifest
repo init -u https://github.com/zeydann/android-cr.git -b 13.0 --git-lfs

# Sync the repo with force to ensure a clean sync
/opt/crave/resync.sh

# Device tree
git clone https://github.com/Kou-Yeager/android_device_xiaomi_mojito-13.git -b 13 device/xiaomi/mojito

# Kernel tree
git clone https://github.com/device-xti/android_kernel_xiaomi_mojito.git -b thirteen kernel/xiaomi/mojito

# Vendor tree
git clone https://github.com/FerryAr/vendor-xiaomi-mojito.git -b thirteen vendor/xiaomi/mojito

# Set up th build environment
. build/envsetup.sh

# Choose the target device
lunch lineage_mojito-userdebug

# full target
m bacon