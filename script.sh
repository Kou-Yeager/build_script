
#!/bin/bash

# Remove the local manifests directory if it exists (cleanup before repo initialization)
rm -rf .repo/local_manifests/

# Initialize ROM manifest
repo init -u https://github.com/LineageOS/android.git -b lineage-20.0 --git-lfs

# Sync the repo with force to ensure a clean sync
/opt/crave/resync.sh

# MiuiCamera
#git clone https://gitlab.com/Sepidermn/vendor-xiaomi-mojito-miuicamera.git -b thirteen vendor/xiaomi/mojito-miuicamera

# Set up th build environment
. build/envsetup.sh

# Choose the target device
brunch mojito userdebug