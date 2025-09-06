#
# SPDX-FileCopyrightText: The Android Open Source Project
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/non_ab_device.mk)

# Inherit from device makefile.
$(call inherit-product, device/realme/salaa/device.mk)

# Inherit some common Evo-X OS stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# ViperFX
$(call inherit-product-if-exists, vendor/ViperFX/ViperFX.mk)

# Evo-X flags
BUILD_BCR := true
EVO_BUILD_TYPE := Unofficial
TARGET_ENABLE_BLUR := true
TARGET_BUILD_DEVICE_AS_WEBCAM := false
TARGET_SUPPORTS_64_BIT_APPS := true
TARGET_SUPPORTS_QUICK_TAP := true
TARGET_INCLUDE_ACCORD := true
TARGET_AOD_WALL := false

# EPPE
TARGET_DISABLE_EPPE := true

# Boot animation
TARGET_INCLUDE_BOOT_ANIMATIONS := true
TARGET_BOOT_ANIMATION_RES := 1080

# GMS
WITH_GMS := true
TARGET_USES_PICO_GAPPS := true 

# Device Information
PRODUCT_DEVICE := salaa
PRODUCT_NAME := lineage_$(PRODUCT_DEVICE)
PRODUCT_BRAND := realme
PRODUCT_MANUFACTURER := $(PRODUCT_BRAND)
PRODUCT_MODEL := $(PRODUCT_DEVICE)

PRODUCT_GMS_CLIENTID_BASE := android-$(PRODUCT_BRAND)

PRODUCT_BUILD_PROP_OVERRIDES += \
    SystemName=$(PRODUCT_DEVICE) \
    SystemDevice=$(PRODUCT_DEVICE) \
    DeviceName=$(PRODUCT_DEVICE) \
    DeviceProduct=$(PRODUCT_DEVICE) \
    BuildFingerprint=oplus/ossi/ossi:12/SP1A.210812.016/1711945668478:user/release-keys \
    BuildDesc="sys_mssi_64_cn_armv82-user 12 SP1A.210812.016 1711679158901 release-keys"
