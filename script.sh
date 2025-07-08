
#!/bin/bash

# Remove the local manifests directory if it exists (cleanup before repo initialization)
rm -rf .repo/local_manifests/
rm -rf prebuilts/clang/host/linux-x86

# Initialize ROM manifest
repo init -u https://github.com/DerpFest-AOSP/android_manifest.git -b 16 --git-lfs

# Sync the repo with force to ensure a clean sync
/opt/crave/resync.sh

# Set up th build environment
. build/envsetup.sh

# Choose the target device
lunch lineage_mojito-bp2a-userdebug

# full target
mka derp