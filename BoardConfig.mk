#
# Copyright (C) 2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/xiaomi/everpal

# Asserts
TARGET_OTA_ASSERT_DEVICE := evergo,evergreen,everpal,opal

# NFC
ODM_MANIFEST_SKUS += nonfc

ODM_MANIFEST_NFC_FILES += \
    hardware/interfaces/compatibility_matrices/manifest.empty.xml

ODM_MANIFEST_NONFC_FILES += \
    $(DEVICE_PATH)/configs/vintf/manifest_nonfc.xml

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 134217728

BOARD_SUPER_PARTITION_SIZE := 9126805504
BOARD_XIAOMI_DYNAMIC_PARTITIONS_SIZE := 9122611200

# Properties
TARGET_ODM_PROP += $(DEVICE_PATH)/configs/props/odm.prop
TARGET_PRODUCT_PROP += $(DEVICE_PATH)/configs/props/product.prop
TARGET_VENDOR_PROP += $(DEVICE_PATH)/configs/props/vendor.prop

# Vintf
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/configs/vintf/manifest.xml

# Inherit from mt6833-common
include device/xiaomi/mt6833-common/BoardConfigCommon.mk
