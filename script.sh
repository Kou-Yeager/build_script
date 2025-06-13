
#!/bin/bash

# Remove the local manifests directory if it exists (cleanup before repo initialization)
rm -rf .repo/local_manifests/

# Initialize ROM manifest
#repo init -u https://github.com/PixelExperience-LEGACY-edition/manifest.git -b thirteen-plus --depth=1 --git-lfs

# Sync the repo with force to ensure a clean sync
#/opt/crave/resync.sh

# remove fwb
rm -rf frameworks/base

# add fwb
git clone https://github.com/Zeydann/frameworks_base-pe.git --depth=1 -b wip frameworks/base

# Device tree
#git clone https://github.com/Zeydann/device_xiaomi_mojito-13.git -b pe device/xiaomi/mojito

# Kernel tree
#git clone https://github.com/device-xti/android_kernel_xiaomi_mojito.git -b thirteen kernel/xiaomi/mojito

# Vendor tree
#git clone https://github.com/FerryAr/vendor-xiaomi-mojito.git -b thirteen vendor/xiaomi/mojito

# MiuiCamera
#git clone https://gitlab.com/Sepidermn/vendor-xiaomi-mojito-miuicamera.git -b thirteen vendor/xiaomi/mojito-miuicamera

# Set up th build environment
. build/envsetup.sh

# Choose the target device
lunch aosp_mojito-userdebug

# full target
mka bacon
