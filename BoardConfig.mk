#
# Copyright (C) 2023 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

DEVICE_PATH := device/samsung/a14x

# Display
TARGET_SCREEN_DENSITY := 450

# Kernel
TARGET_KERNEL_CONFIG := vendor/a14x_defconfig
TARGET_KERNEL_SOURCE := kernel/samsung/s5e8535
BOARD_DTB_CFG := $(DEVICE_PATH)/configs/kernel/s5e8535.cfg
BOARD_DTBO_CFG := $(DEVICE_PATH)/configs/kernel/a14x.cfg
BOARD_KERNEL_SEPARATED_DTBO := true
BOARD_INCLUDE_DTB_IN_BOOTIMG := true

# Recovery
BOARD_RECOVERY_MKBOOTIMG_ARGS += --header_version 2
BOARD_RECOVERY_MKBOOTIMG_ARGS += --kernel_offset $(BOARD_KERNEL_OFFSET)
BOARD_RECOVERY_MKBOOTIMG_ARGS += --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_RECOVERY_MKBOOTIMG_ARGS += --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)
BOARD_RECOVERY_MKBOOTIMG_ARGS += --second_offset $(BOARD_KERNEL_SECOND_OFFSET)
BOARD_RECOVERY_MKBOOTIMG_ARGS += --pagesize $(BOARD_KERNEL_PAGESIZE) --board $(BOARD_NAME)
BOARD_RECOVERY_MKBOOTIMG_ARGS += --dtb_offset 0x00000000
BOARD_INCLUDE_RECOVERY_DTBO := true
TARGET_USES_MKE2FS := true

# Board
BOARD_NAME := SRPVG28A003

# OTA assert
TARGET_OTA_ASSERT_DEVICE := a14x

# Kernel modules
BOARD_VENDOR_RAMDISK_KERNEL_MODULES_LOAD := $(strip $(shell cat $(DEVICE_PATH)/modules.load))
BOOT_KERNEL_MODULES := $(BOARD_VENDOR_RAMDISK_KERNEL_MODULES_LOAD)
BOARD_RECOVERY_RAMDISK_KERNEL_MODULES_LOAD := $(strip $(shell cat $(DEVICE_PATH)/modules.load))
RECOVERY_KERNEL_MODULES := $(BOARD_RECOVERY_RAMDISK_KERNEL_MODULES_LOAD)

# Inherit from the common tree
include device/samsung/universal8535-common/BoardConfigCommon.mk

# Inherit optional vendor BoardConfig
include vendor/samsung/universal8535/BoardConfigVendor.mk
