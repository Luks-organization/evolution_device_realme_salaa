#
# SPDX-FileCopyrightText: The Android Open Source Project
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

# Apply vndk patch
cd device/realme/salaa/patches && ./apply.sh && cd && cd evo

# Make the build faster using ccache
export USE_CCACHE=1
export CCACHE_DIR=~/.ccache
ccache -M 50G
ccache -o compression=true

# Disable and stop systemd-oomd service.
systemctl disable --now systemd-oomd && sudo apt-get purge systemd-oomd -y
