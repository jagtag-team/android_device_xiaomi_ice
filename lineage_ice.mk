#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from ice device
$(call inherit-product, device/xiaomi/ice/device.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

PRODUCT_DEVICE := ice
PRODUCT_NAME := lineage_ice
PRODUCT_BRAND := Redmi
PRODUCT_MODEL := ice
PRODUCT_MANUFACTURER := xiaomi

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildDesc="vnd_ice-user 12 SP1A.210812.016 V13.0.17.0.SGMINXM release-keys" \
    BuildFingerprint=Redmi/ice_in/ice:12/SP1A.210812.016/V13.0.17.0.SGMINXM:user/release-keys
