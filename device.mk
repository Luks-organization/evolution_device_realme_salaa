#
# SPDX-FileCopyrightText: The Android Open Source Project
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/realme/salaa

# Installs gsi keys into ramdisk, to boot a developer GSI with verified boot.
$(call inherit-product, $(SRC_TARGET_DIR)/product/developer_gsi_keys.mk)

# Enable project quotas and casefolding for emulated storage without sdcardfs
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)

# Enforce generic ramdisk allow list
$(call inherit-product, $(SRC_TARGET_DIR)/product/generic_ramdisk.mk)

# IMS
$(call inherit-product, vendor/mediatek/ims/ims.mk)

# Dynamic Partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true
PRODUCT_BUILD_SUPER_PARTITION ?= false

# Update
AB_OTA_UPDATER := false

# Shipping API level
BOARD_SHIPPING_API_LEVEL := 30
PRODUCT_SHIPPING_API_LEVEL := 29

# Userdata
PRODUCT_FS_COMPRESSION := 1

# Kernel
PRODUCT_ENABLE_UFFD_GC := true

# AAPT
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# Boot animation
TARGET_SCREEN_HEIGHT := 2400
TARGET_SCREEN_WIDTH := 1080

# Reduce system server verbosity.
PRODUCT_SYSTEM_SERVER_DEBUG_INFO := false
PRODUCT_OTHER_JAVA_DEBUG_INFO := false

# Dexpreopt
WITH_DEXPREOPT_DEBUG_INFO := false

# Compiler filter
PRODUCT_DEX_PREOPT_DEFAULT_COMPILER_FILTER := speed-profile
PRODUCT_SYSTEM_SERVER_COMPILER_FILTER := speed-profile

# Inherit several Android Go Configurations (Beneficial for everyone, even on non-Go devices)
PRODUCT_USE_PROFILE_FOR_BOOT_IMAGE := true
PRODUCT_DEX_PREOPT_BOOT_IMAGE_PROFILE_LOCATION := frameworks/base/boot/boot-image-profile.txt

# Audio
PRODUCT_PACKAGES += \
    android.hardware.audio.service \
    android.hardware.audio.effect@6.0-impl \
    android.hardware.audio.effect@7.0-impl \
    android.hardware.audio.common-util.vendor \
    audio.bluetooth.default \
    audio_policy.stub \
    audio.r_submix.default \
    audio.usb.default \
    libhapticgenerator \
    libaudioroute.vendor \
    libsndcardparser \
    libdynproc \
    libopus.vendor

# Soundtrigger
PRODUCT_PACKAGES += \
    android.hardware.soundtrigger@2.3-impl

# Copy audio configuration files
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(DEVICE_PATH)/configs/audio,$(TARGET_COPY_OUT_VENDOR)/etc) \
    $(call find-copy-subdir-files,*,$(DEVICE_PATH)/configs/sysconfig/,$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/sysconfig)

PRODUCT_COPY_FILES += \
    frameworks/av/services/audiopolicy/config/a2dp_audio_policy_configuration_7_0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/a2dp_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/a2dp_in_audio_policy_configuration_7_0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/a2dp_in_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/bluetooth_audio_policy_configuration_7_0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/r_submix_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/r_submix_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/usb_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/usb_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/default_volume_tables.xml:$(TARGET_COPY_OUT_VENDOR)/etc/default_volume_tables.xml \
    frameworks/av/services/audiopolicy/config/audio_policy_volumes.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_volumes.xml

PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/dax/dax-default.xml:$(TARGET_COPY_OUT_VENDOR)/etc/dolby/dax-default.xml \
    $(DEVICE_PATH)/configs/aurisys/aurisys_config.xml:$(TARGET_COPY_OUT_ODM)/etc/audio/aurisys_config/aurisys_config.xml \
    $(DEVICE_PATH)/configs/aurisys/aurisys_config_hifi3.xml:$(TARGET_COPY_OUT_ODM)/etc/audio/aurisys_config_hifi3/aurisys_config_hifi3.xml \
    $(DEVICE_PATH)/configs/aurisys/virtual_audio_policy_configuration.xml:$(TARGET_COPY_OUT_ODM)/etc/virtual_audio_policy_configuration.xml

# Dsp Volume Synchronizer
PRODUCT_PACKAGES += \
    DSPVolumeSynchronizer

# Oplus Parts
PRODUCT_PACKAGES += \
    RealmeParts

# HWOverlays Disable
PRODUCT_PACKAGES += \
    DisableHWOverlaysService

# Doze
PRODUCT_PACKAGES += \
    OplusDoze

# Oplus Device Service
PRODUCT_PACKAGES += \
    OplusDeviceService

# Rcs Service
PRODUCT_PACKAGES += \
    com.android.ims.rcsmanager \
    RcsService \
    PresencePolling

# Mtk In Call Service
PRODUCT_PACKAGES += \
    MtkInCallService

# Vendor Service Manager
PRODUCT_PACKAGES += \
    vndservicemanager

# Biometrics
PRODUCT_PACKAGES += \
    android.hardware.biometrics.fingerprint@2.3-service.oplus

# Bluetooth
PRODUCT_PACKAGES += \
    android.hardware.bluetooth.audio-impl

# Bluetooth Library Deps
PRODUCT_PACKAGES += \
    libbluetooth_audio_session \
    libldacBT_enc \
    libldacBT_abr \
    libldacBT_bco \
    libldacBT_bco.vendor \
    liblhdc \
    liblhdcdec

# Camera
PRODUCT_PACKAGES += \
    libcamera2ndk_vendor \
    liblz4.vendor

# DRM
PRODUCT_PACKAGES += \
    android.hardware.drm-service.clearkey \
    libmockdrmcryptoplugin

# HIDL
PRODUCT_PACKAGES += \
    android.hidl.base@1.0 \
    android.hidl.base@1.0.vendor \
    android.hidl.manager@1.0 \
    android.hidl.manager@1.0.vendor \
    libhidltransport \
    libhidltransport.vendor \
    libhwbinder \
    libhwbinder.vendor

# Display
PRODUCT_PACKAGES += \
    android.hardware.graphics.composer@2.3-service \
    android.hardware.memtrack-service.mediatek-mali \
    libhwc2onfbadapter

# LiveDisplay
PRODUCT_PACKAGES += \
    vendor.lineage.livedisplay@2.1-service-salaa

# ConfigStore
PRODUCT_PACKAGES += \
    disable_configstore

# Lineage Touch
PRODUCT_PACKAGES += \
    vendor.lineage.touch-service.salaa

# Sensors
PRODUCT_PACKAGES += \
    vendor.lineage.oplus_als.service \
    android.hardware.sensors@1.0-service \
    android.hardware.sensors@1.0-impl:64 \
    sensors.als_wrapper:64 \
    sensors.oplus_virtual:64

PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/sensors/hals.conf:$(TARGET_COPY_OUT_VENDOR)/etc/sensors/hals.conf

# RenderScript
PRODUCT_PACKAGES += \
    android.hardware.renderscript@1.0-impl

# Fastboot
PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.1-impl-mock \
    fastbootd

# Gatekeeper
PRODUCT_PACKAGES += \
    android.hardware.gatekeeper@1.0-service \
    android.hardware.gatekeeper@1.0-impl

# Health
PRODUCT_PACKAGES += \
    android.hardware.health-service.mediatek \
    android.hardware.health-service.mediatek-recovery

# Lineage Health
$(call soong_config_set,lineage_health,charging_control_charging_path,/sys/class/oplus_chg/battery/mmi_charging_enable)
$(call soong_config_set,lineage_health,charging_control_supports_bypass,false)

PRODUCT_PACKAGES += \
    vendor.lineage.health-service.default

# Light
PRODUCT_PACKAGES += \
    android.hardware.light-service.salaa

# Keystore
PRODUCT_PACKAGES += \
    android.hardware.hardware_keystore.xml

# Keymaster
PRODUCT_PACKAGES += \
    android.hardware.keymaster-V3-ndk.vendor \
    libkeymaster4support.vendor:64 \
    libsoft_attestation_cert.vendor:64 \
    libkeystore-engine-wifi-hidl \
    libkeystore-wifi-hidl \

# Media (C2)
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(DEVICE_PATH)/configs/media,$(TARGET_COPY_OUT_VENDOR)/etc)

PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_google_c2.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_c2.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_c2_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_c2_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_c2_video.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_c2_video.xml

# Codec2 Props
PRODUCT_VENDOR_PROPERTIES += \
    vendor.audio.c2.preferred=true \
    debug.c2.use_dmabufheaps=1 \
    vendor.qc2audio.suspend.enabled=true \
    vendor.qc2audio.per_frame.flac.dec.enabled=true

# Dolby Props
PRODUCT_VENDOR_PROPERTIES += \
    ro.vendor.audio.dolby.dax.support=true \
    ro.vendor.dolby.dax.version=DAX3_3.7.0.8_r1 \
    vendor.audio.dolby.ds2.hardbypass=false \
    vendor.audio.dolby.ds2.enabled=false

# Spatial Audio: optimize spatializer effect
PRODUCT_PROPERTY_OVERRIDES += \
    audio.spatializer.effect.util_clamp_min=300

# Spatial Audio: declare use of spatial audio
PRODUCT_PROPERTY_OVERRIDES += \
    ro.audio.spatializer_enabled=true \
    ro.audio.headtracking_enabled=true \
    ro.audio.spatializer_transaural_enabled_default=false \
    persist.vendor.audio.spatializer.speaker_enabled=true

# Seccomp policy
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(DEVICE_PATH)/configs/seccomp,$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy)

# NFC
PRODUCT_PACKAGES += \
    android.hardware.nfc@1.2-service \
    com.android.nfc_extras \
    libchrome.vendor \
    Tag

PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/permissions/nfc_features.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/sku_nfc/nfc_features.xml

# USB
$(call soong_config_set,android_hardware_mediatek_usb,audio_accessory_supported,true)

PRODUCT_PACKAGES += \
    android.hardware.usb-service.mediatek \
    android.hardware.usb.gadget-service.mediatek

# Overlays
PRODUCT_ENFORCE_RRO_TARGETS := *
PRODUCT_PACKAGES += \
    NcmTetheringOverlay \
    OplusDozeOverlaySalaa \
    DeviceAsWebcamOverlaySalaa \
    FrameworksResOverlaySalaa \
    PowerOffAlarmOverlaySalaa \
    SettingsProviderOverlayRMX2151L1 \
    SettingsProviderOverlayRMX2155L1 \
    SettingsProviderOverlayRMX2156L1 \
    SettingsProviderOverlayRMX2161L1 \
    SettingsProviderOverlayRMX2163L1 \
    SettingsProviderOverlaySalaa \
    TetheringResOverlaySalaa \
    SystemUIOverlaySalaa \
    WifiResOverlaySalaa \
    NfcOverlaySalaa \
    SettingsOverlaySalaa \
    LineageSDKResTarget \
    LineageSettingsProviderResTarget \
    SimpleDeviceConfigResTarget \
    ApertureResTarget

# Public libraries
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/public.libraries/public.libraries.txt:$(TARGET_COPY_OUT_VENDOR)/etc/public.libraries.txt \
    $(DEVICE_PATH)/configs/public.libraries/public.libraries-trustonic.txt:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/public.libraries-trustonic.txt

# Permission
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/permissions/privapp-permissions-hotword.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-hotword.xml \
    $(DEVICE_PATH)/configs/permissions/privapp-permissions-xhotword.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-xhotword.xml \
    $(DEVICE_PATH)/configs/permissions/privapp-permissions-com.mediatek.engineermode.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/permissions/privapp-permissions-com.mediatek.engineermode.xml \
    $(DEVICE_PATH)/configs/permissions/com.android.hotwordenrollment.common.util.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/permissions/com.android.hotwordenrollment.common.util.xml \
    $(DEVICE_PATH)/configs/permissions/com.motorola.frameworks.core.addon.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/permissions/com.motorola.frameworks.core.addon.xml \
    $(DEVICE_PATH)/configs/permissions/com.motorola.motosignature.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/permissions/com.motorola.motosignature.xml \
    $(DEVICE_PATH)/configs/permissions/com.motorola.software.dolbyui.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/permissions/com.motorola.software.dolbyui.xml \
    $(DEVICE_PATH)/configs/permissions/moto.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/permissions/moto.xml \
    $(DEVICE_PATH)/configs/permissions/moto-checkin.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/permissions/moto-checkin.xml \
    $(DEVICE_PATH)/configs/permissions/moto-settings.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/permissions/moto-settings.xml \
    $(DEVICE_PATH)/configs/permissions/privapp-com.dolby.daxservice.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/permissions/privapp-com.dolby.daxservice.xml \
    $(DEVICE_PATH)/configs/permissions/privapp-com.motorola.android.providers.settings.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/permissions/privapp-com.motorola.android.providers.settings.xml \
    $(DEVICE_PATH)/configs/permissions/privapp-com.motorola.dolby.dolbyui.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/permissions/privapp-com.motorola.dolby.dolbyui.xml \
    $(DEVICE_PATH)/configs/permissions/android.hardware.sensor.dynamic.head_tracker.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.dynamic.head_tracker.xml \
    $(DEVICE_PATH)/configs/permissions/com.mediatek.hardware.vow_dsp.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/com.mediatek.hardware.vow_dsp.xml \
    $(DEVICE_PATH)/configs/permissions/android.hardware.sensor.dynamic.head_tracker.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.dynamic.head_tracker.xml \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.audio.low_latency.xml \
    frameworks/native/data/etc/android.hardware.audio.pro.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.audio.pro.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.camera.external.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.external.xml \
    frameworks/native/data/etc/android.hardware.camera.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.fingerprint.xml \
    frameworks/native/data/etc/android.hardware.faketouch.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.faketouch.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.opengles.aep.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.opengles.aep.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepcounter.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepdetector.xml \
    frameworks/native/data/etc/android.hardware.se.omapi.uicc.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.se.omapi.uicc.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.multitouch.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.vulkan.compute-0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.compute.xml \
    frameworks/native/data/etc/android.hardware.vulkan.level-1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.level.xml \
    frameworks/native/data/etc/android.hardware.vulkan.version-1_1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.version.xml \
    frameworks/native/data/etc/android.hardware.wifi.aware.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.aware.xml \
    frameworks/native/data/etc/android.hardware.wifi.rtt.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.rtt.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.wifi.passpoint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.passpoint.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.software.midi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.midi.xml \
    frameworks/native/data/etc/android.software.opengles.deqp.level-2020-03-01.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.opengles.deqp.level.xml \
    frameworks/native/data/etc/android.software.verified_boot.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.verified_boot.xml \
    frameworks/native/data/etc/android.software.vulkan.deqp.level-2020-03-01.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.vulkan.deqp.level.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.software.freeform_window_management.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.freeform_window_management.xml

# Power
$(call soong_config_set,power_libperfmgr,mode_extension_lib,//$(DEVICE_PATH):libperfmgr-ext-salaa)

PRODUCT_PACKAGES += \
    android.hardware.power-service.pixel-libperfmgr \
    vendor.mediatek.hardware.mtkpower@1.2-service.stub \
    libmtkperf_client_vendor \
    libmtkperf_client

PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/profiles/cgroups_29.json:$(TARGET_COPY_OUT_VENDOR)/etc/cgroups.json \
    $(DEVICE_PATH)/configs/profiles/task_profiles.json:$(TARGET_COPY_OUT_VENDOR)/etc/task_profiles.json \
    $(DEVICE_PATH)/configs/power/powerhint.json:$(TARGET_COPY_OUT_VENDOR)/etc/powerhint.json

PRODUCT_PACKAGES += \
    PowerOffAlarm

# Radio
PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.radio.force_lte_ca=true

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.telephony.ims.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.ims.xml \
    frameworks/native/data/etc/android.hardware.telephony.radio.access.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.radio.access.xml \
    frameworks/native/data/etc/android.hardware.broadcastradio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.broadcastradio.xml \
    frameworks/native/data/etc/android.hardware.telephony.data.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.data.xml \
    frameworks/native/data/etc/android.hardware.telephony.calling.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.calling.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.hardware.telephony.cdma.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.cdma.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.software.ipsec_tunnel_migration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.ipsec_tunnel_migration.xml \
    frameworks/native/data/etc/android.software.ipsec_tunnels.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.ipsec_tunnels.xml

# Ramdisk
PRODUCT_PACKAGES += \
    init.mt6785.power.rc \
    init.mt6785.rc \
    init.mt6785.usb.rc \
    init.nfc_detect.rc \
    init.oplus.rc \
    init.target.rc \
    fstab.mt6785 \
    fstab.mt6785_ramdisk \
    fstab.zram \
    ueventd.mtk.rc \
    ueventd.oplus.rc \
    parts.rc \
    nfc_detect.sh \
    move_widevine_data.sh

PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/init/init.recovery.mt6785.rc:$(TARGET_COPY_OUT_RECOVERY)/root/init.recovery.mt6785.rc

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(DEVICE_PATH) \
    $(DEVICE_PATH)/touch \
    bootable/deprecated-ota \
    hardware/google/interfaces \
    hardware/google/pixel \
    hardware/mediatek/libmtkperf_client \
    hardware/lineage/compat \
    hardware/mediatek \
    hardware/oplus

# Dex2oat
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.dex2oat64.enabled=true \
    pm.dexopt.bg-dexopt=everything

# Thermal
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/thermal_info_config/thermal_info_config.json:$(TARGET_COPY_OUT_VENDOR)/etc/thermal_info_config.json

PRODUCT_PACKAGES += \
    android.hardware.thermal-service.mediatek

# Vibrator
$(call soong_config_set,mediatek_vibrator,supports_effects,true)

PRODUCT_PACKAGES += \
    android.hardware.vibrator-service.mediatek

# VNDK
PRODUCT_PACKAGES += \
    libbinder-v32 \
    libhidlbase-v32 \
    libutils-v32 \
    libstagefright_foundation_v33

# Wi-Fi
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(DEVICE_PATH)/configs/wifi/,$(TARGET_COPY_OUT_VENDOR)/etc/wifi)

PRODUCT_PACKAGES += \
    android.hardware.wifi-service \
    libwifi-hal-wrapper:64 \
    wpa_supplicant \
    hostapd

# Log tag
include $(DEVICE_PATH)/configs/props/vendor_logtag.mk

# Init
$(call soong_config_set,libinit,vendor_init_lib,//$(DEVICE_PATH):libinit_salaa)

# Inherit vendor the proprietary files
$(call inherit-product, vendor/realme/salaa/salaa-vendor.mk)
