#
# SPDX-FileCopyrightText: RisingOS-Revived
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit_only.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from device makefile
$(call inherit-product, device/xiaomi/everpal/device.mk)

# Inherit some common RisingOS stuff (based on LineageOS)
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Device identifier
PRODUCT_NAME := rising_everpal
PRODUCT_DEVICE := everpal
PRODUCT_MANUFACTURER := Xiaomi
PRODUCT_BRAND := Redmi
PRODUCT_MODEL := Redmi Note 11T 5G

# Build info
PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

# RisingOS Specific Build Flags
# Lunch banner maintainer variable
RISING_MAINTAINER := "himanshuksr0007"

# Chipset/Maintainer properties (ro.rising.chipset/ro.rising.maintainer)
PRODUCT_BUILD_PROP_OVERRIDES += \
    RisingChipset="MediaTek Dimensity 810" \
    RisingMaintainer="himanshuksr0007"

# Blur support (optional, set to true/false)
TARGET_ENABLE_BLUR := true

# Camera support (false = ship with camera, true = don't ship)
PRODUCT_NO_CAMERA := false

# Lawnchair launcher (optional, set to true/false)
TARGET_PREBUILT_LAWNCHAIR_LAUNCHER := true

# GMS Flags
WITH_GMS := true
TARGET_USES_PICO_GAPPS := true

# Optional: Pixel Launcher
TARGET_DEFAULT_PIXEL_LAUNCHER := true
