#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

# A/B
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota.mk)

PRODUCT_PACKAGES += \
    android.hardware.boot@1.2-mtkimpl \
    android.hardware.boot@1.2-service

PRODUCT_PACKAGES += \
    update_engine \
    update_engine_sideload \
    update_verifier

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=erofs \
    POSTINSTALL_OPTIONAL_system=true

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_vendor=true \
    POSTINSTALL_PATH_vendor=bin/checkpoint_gc \
    FILESYSTEM_TYPE_vendor=erofs \
    POSTINSTALL_OPTIONAL_vendor=true

PRODUCT_PACKAGES += \
    checkpoint_gc \
    otapreopt_script

# API levels
PRODUCT_SHIPPING_API_LEVEL := 31

# fastbootd
PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.1-impl-mock \
    fastbootd

# Health
PRODUCT_PACKAGES += \
    android.hardware.health@2.1-impl \
    android.hardware.health@2.1-service

# Overlays
PRODUCT_ENFORCE_RRO_TARGETS := *

# Partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Product characteristics
PRODUCT_CHARACTERISTICS := default

# Rootdir
PRODUCT_PACKAGES += \
    init.insmod.sh \

PRODUCT_PACKAGES += \
    fstab.mt6761

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/first_stage_ramdisk/fstab.mt6761:$(TARGET_VENDOR_RAMDISK_OUT)/first_stage_ramdisk/fstab.mt6761

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/recovery/root/init.recovery.mt6761.rc:recovery/root/init.recovery.mt6761.rc \
    $(LOCAL_PATH)/rootdir/init.recovery.usb.rc:recovery/root/init.recovery.usb.rc \
    $(LOCAL_PATH)/rootdir/etc/init.recovery.usbfix.rc:recovery/root/system/etc/init/init.recovery.usbfix.rc \
    $(LOCAL_PATH)/rootdir/ueventd.mt6761.rc:recovery/root/ueventd.mt6761.rc \
    $(LOCAL_PATH)/recovery/root/system/vendor/firmware/focaltech_ts_fw_helitai.bin:recovery/root/system/vendor/firmware/focaltech_ts_fw_helitai.bin \
    $(LOCAL_PATH)/recovery/root/system/vendor/firmware/novatek_ts_truly_fw.bin:recovery/root/system/vendor/firmware/novatek_ts_truly_fw.bin \
    $(LOCAL_PATH)/recovery/root/system/vendor/firmware/novatek_ts_truly_mp.bin:recovery/root/system/vendor/firmware/novatek_ts_truly_mp.bin
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/recovery/root/system/etc/init/snapuserd.rc:recovery/root/system/etc/init/snapuserd.rc
PRODUCT_PACKAGES += \
    snapuserd \
    snapuserd.recovery
