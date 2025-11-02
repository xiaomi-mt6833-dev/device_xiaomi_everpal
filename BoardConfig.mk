#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/xiaomi/everpal

# A/B
AB_OTA_PARTITIONS += \
    boot \
    system \
    system_ext \
    product \
    vendor \
    vendor_dlkm \
    odm \
    vbmeta \
    vbmeta_system \
    vbmeta_vendor

BOARD_USES_RECOVERY_AS_BOOT := true

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-2a-dotprod
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_VARIANT := cortex-a76

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-2a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a55

# Asserts
TARGET_OTA_ASSERT_DEVICE := evergo,evergreen,everpal,opal

# Boot Image
BOARD_KERNEL_CMDLINE := bootopt=64S3,32N2,64N2
BOARD_KERNEL_CMDLINE += androidboot.init_fatal_reboot_target=recovery

BOARD_BOOTIMG_HEADER_VERSION := 2
BOARD_INCLUDE_DTB_IN_BOOTIMG := true

BOARD_KERNEL_BASE := 0x40078000
BOARD_KERNEL_OFFSET := 0x00008000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_TAGS_OFFSET := 0x07c08000
BOARD_RAMDISK_OFFSET := 0x11088000
BOARD_DTB_OFFSET := 0x07c08000

BOARD_MKBOOTIMG_ARGS := --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)
BOARD_MKBOOTIMG_ARGS += --dtb_offset $(BOARD_DTB_OFFSET)
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOTIMG_HEADER_VERSION)

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := everpal
TARGET_NO_BOOTLOADER := true

# Display
TARGET_SCREEN_DENSITY := 440

# Enable 64-bit for non-zygote.
ZYGOTE_FORCE_64 := true

# Include 64-bit drmserver to support 64-bit only devices
TARGET_DYNAMIC_64_32_DRMSERVER := true

# Include 64-bit mediaserver to support 64-bit only devices
TARGET_DYNAMIC_64_32_MEDIASERVER := true

# Kernel
TARGET_KERNEL_SOURCE := kernel/xiaomi/mt6833
TARGET_KERNEL_CONFIG := everpal_defconfig
BOARD_KERNEL_IMAGE_NAME := Image.gz

# NFC
ODM_MANIFEST_SKUS += nfc nonfc

ODM_MANIFEST_NFC_FILES += \
    hardware/interfaces/compatibility_matrices/manifest.empty.xml

ODM_MANIFEST_NONFC_FILES += \
    $(DEVICE_PATH)/configs/vintf/manifest_nonfc.xml

# Partitions
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_BOOTIMAGE_PARTITION_SIZE := 134217728
BOARD_USES_METADATA_PARTITION := true

BOARD_SUPER_PARTITION_GROUPS := xiaomi_dynamic_partitions
BOARD_SUPER_PARTITION_SIZE := 9126805504
BOARD_XIAOMI_DYNAMIC_PARTITIONS_PARTITION_LIST := \
    system \
    system_ext \
    product \
    vendor \
    vendor_dlkm \
    odm
BOARD_XIAOMI_DYNAMIC_PARTITIONS_SIZE := 9122611200

BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_SYSTEM_EXTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDOR_DLKMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_ODMIMAGE_FILE_SYSTEM_TYPE := ext4

TARGET_COPY_OUT_SYSTEM_EXT := system_ext
TARGET_COPY_OUT_PRODUCT := product
TARGET_COPY_OUT_VENDOR := vendor
TARGET_COPY_OUT_VENDOR_DLKM := vendor_dlkm
TARGET_COPY_OUT_ODM := odm

-include vendor/lineage/config/BoardConfigReservedSize.mk

# Platform
TARGET_BOARD_PLATFORM := mt6833

# Properties
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/configs/props/system.prop
TARGET_SYSTEM_EXT_PROP += $(DEVICE_PATH)/configs/props/system_ext.prop
TARGET_PRODUCT_PROP += $(DEVICE_PATH)/configs/props/product.prop
TARGET_VENDOR_PROP += $(DEVICE_PATH)/configs/props/vendor.prop
TARGET_ODM_PROP += $(DEVICE_PATH)/configs/props/odm.prop

# RIL
ENABLE_VENDOR_RIL_SERVICE := true

# Recovery
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/init/fstab.mt6833
TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# SEPolicy
include device/mediatek/sepolicy_vndr/SEPolicy.mk
BOARD_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/vendor
SYSTEM_EXT_PRIVATE_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/private

# Security Patch Level
VENDOR_SECURITY_PATCH := 2024-02-01

# Verified Boot
BOARD_AVB_ENABLE := true
BOARD_AVB_ALGORITHM := SHA256_RSA2048
BOARD_AVB_KEY_PATH := external/avb/test/data/testkey_rsa2048.pem
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --set_hashtree_disabled_flag

BOARD_AVB_BOOT_KEY_PATH := external/avb/test/data/testkey_rsa2048.pem
BOARD_AVB_BOOT_ALGORITHM := SHA256_RSA2048
BOARD_AVB_BOOT_ROLLBACK_INDEX := 1
BOARD_AVB_BOOT_ROLLBACK_INDEX_LOCATION := 1

BOARD_AVB_VBMETA_SYSTEM := product system system_ext
BOARD_AVB_VBMETA_SYSTEM_KEY_PATH := external/avb/test/data/testkey_rsa2048.pem
BOARD_AVB_VBMETA_SYSTEM_ALGORITHM := SHA256_RSA2048
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX := 1
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX_LOCATION := 2

BOARD_AVB_VBMETA_VENDOR := vendor vendor_dlkm odm
BOARD_AVB_VBMETA_VENDOR_KEY_PATH := external/avb/test/data/testkey_rsa2048.pem
BOARD_AVB_VBMETA_VENDOR_ALGORITHM := SHA256_RSA2048
BOARD_AVB_VBMETA_VENDOR_ROLLBACK_INDEX := 1
BOARD_AVB_VBMETA_VENDOR_ROLLBACK_INDEX_LOCATION := 3

# Vintf
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/configs/vintf/manifest.xml
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE += \
    hardware/mediatek/vintf/mediatek_framework_compatibility_matrix.xml \
    hardware/xiaomi/vintf/xiaomi_framework_compatibility_matrix.xml

# WiFi
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_HOSTAPD_DRIVER := NL80211
WIFI_DRIVER_FW_PATH_PARAM := "/dev/wmtWifi"
WIFI_DRIVER_FW_PATH_STA := "STA"
WIFI_DRIVER_FW_PATH_AP := "AP"
WIFI_DRIVER_FW_PATH_P2P := "P2P"
WIFI_DRIVER_STATE_CTRL_PARAM := "/dev/wmtWifi"
WIFI_DRIVER_STATE_ON := "1"
WIFI_DRIVER_STATE_OFF := "0"
WIFI_HIDL_FEATURE_DUAL_INTERFACE := true
WIFI_HIDL_UNIFIED_SUPPLICANT_SERVICE_RC_ENTRY := true

# Inherit the proprietary files
include vendor/xiaomi/everpal/BoardConfigVendor.mk
# Inherit RisingOS vendor board configs if available
-include vendor/lineage/config/BoardConfigCommon.mk
