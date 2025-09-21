#
# Copyright (C) 2016 The Android Open Source Project
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

PRODUCT_PACKAGE_OVERLAYS := device/generic/car/common/overlay
#PRODUCT_PACKAGE_OVERLAYS := vendor/Ameen/overlay

$(call inherit-product, device/generic/car/emulator/aosp_car_emulator.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/sdk_x86_64.mk)

EMULATOR_VENDOR_NO_SOUND := true
PRODUCT_NAME := ameens_car_x86_64
PRODUCT_DEVICE := ameens_car_x86_64
PRODUCT_BRAND := Amoid
PRODUCT_MODEL := Amoid on x86_64 emulator

DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE := device/AmCorp/ameens_car_x86_64/device_framework_matrix_product_ameens.xml

PRODUCT_PACKAGES += \
    vndservicemanager \
    MyDemoApp \
#   vendor-privapp-permission.xml \
# 	preinstalled-packages-vendor.xml \
#   DemoService \
#	  RecordingAppService \ 
#	  BTMusicApp \


#include vendor/Ameen/packages/apps/MyCarApp/MyCarApp.mk

#enable my native service
#include vendor/Ameen/packages/services/MyNativeService/MyNativeService.mk

#enable my hal service.
include vendor/ameen/hardware/interfaces/ameens/MyHalService.mk

#TARGET_COPY_OUT_PRODUCT
#TARGET_COPY_OUT_VENDOR

# Whitelisted packages per user type
PRODUCT_COPY_FILES += \
  vendor/ameen/etc/sysconfig/preinstalled-packages-vendor.xml:$(TARGET_COPY_OUT_VENDOR)/etc/sysconfig/preinstalled-packages-vendor.xml \

PRODUCT_COPY_FILES += \
  vendor/ameen/etc/permissions/vendor-privapp-permission.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/vendor-privapp-permission.xml \

