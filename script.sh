
#!/bin/bash

# Remove the local manifests directory if it exists (cleanup before repo initialization)
rm -rf .repo/local_manifests/
rm -rf prebuilts/clang/host/linux-x86

# Initialize ROM manifest
repo init -u https://github.com/crdroid-13-fork/android.git -b 13.0 --git-lfs

# Sync the repo with force to ensure a clean sync
/opt/crave/resync.sh

# Leica
git clone --depth=1 https://gitlab.com/pnplusplus/android_vendor_xiaomi_mojito-leicacamera vendor/xiaomi/mojito-leicacamera

# Set up th build environment
. build/envsetup.sh

# Choose the target device
lunch lineage_mojito-userdebug

# full target
m bacon