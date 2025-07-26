#
# SPDX-FileCopyrightText: The Android Open Source Project
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

# Unzip bloobs
unzip vendor/realme/salaa/radio/md1img.zip -d vendor/realme/salaa/radio && rm vendor/realme/salaa/radio/md1img.zip
unzip vendor/realme/salaa/proprietary/odm/lib64/libstfaceunlockppl.zip -d vendor/realme/salaa/proprietary/odm/lib64 && rm vendor/realme/salaa/proprietary/odm/lib64/libstfaceunlockppl.zip

# Apply vndk patch
#cd device/realme/salaa/patches && ./apply.sh && cd && cd evo

# Disable and stop systemd-oomd service.
systemctl disable --now systemd-oomd && sudo apt-get purge systemd-oomd -y
