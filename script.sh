
#!/bin/bash

# Remove the local manifests directory if it exists (cleanup before repo initialization)
rm -rf .repo/local_manifests/
rm -rf prebuilts/clang/host/linux-x86

# Initialize ROM manifest
repo init -u https://github.com/Lunaris-AOSP/android -b 16 --git-lfs

# Sync the repo with force to ensure a clean sync
/opt/crave/resync.sh

# remove
rm -rf packages/apps/Settings

# add
git clone https://github.com/Kou-Yeager/packages_apps_Settings.git -b 16 packages/apps/Settings

# Set up th build environment
. b*/env*

# Choose the target device
lunch lineage_mojito-bp2a-userdebug

# full target
m lunaris