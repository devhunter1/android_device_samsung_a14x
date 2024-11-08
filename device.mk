#
# Copyright (C) 2021 The LineageOS Project
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

# Inherit from the common tree
$(call inherit-product, device/samsung/universal8535-common/common.mk)

# Load kernel firmwares
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/vendor/firmware/ili7807_a14x.bin:$(TARGET_COPY_OUT_VENDOR_RAMDISK)/vendor/firmware/ili7807_a14x.bin \
    $(DEVICE_PATH)/vendor/firmware/nt36672_a14x_2ndbr_tianma.bin:$(TARGET_COPY_OUT_VENDOR_RAMDISK)/vendor/firmware/nt36672_a14x_2ndbr_tianma.bin \
    $(DEVICE_PATH)/vendor/firmware/nt36672_a14x_2ndbr_tianma_mp.bin:$(TARGET_COPY_OUT_VENDOR_RAMDISK)/vendor/firmware/nt36672_a14x_2ndbr_tianma_mp.bin \
    $(DEVICE_PATH)/vendor/firmware/nt36672_a14x_tianma.bin:$(TARGET_COPY_OUT_VENDOR_RAMDISK)/vendor/firmware/nt36672_a14x_tianma.bin \
    $(DEVICE_PATH)/vendor/firmware/nt36672_a14x_tianma_mp.bin:$(TARGET_COPY_OUT_VENDOR_RAMDISK)/vendor/firmware/nt36672_a14x_tianma_mp.bin \
    $(DEVICE_PATH)/vendor/firmware/td4160_a13x_boe.bin:$(TARGET_COPY_OUT_VENDOR_RAMDISK)/vendor/firmware/td4160_a13x_boe.bin
    
# Overlays
PRODUCT_PACKAGES += \
    FrameworksResOverlay_a14x
