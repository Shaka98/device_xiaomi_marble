#
# Copyright (C) 2022-2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# NFC
TARGET_NFC_SUPPORTED_SKUS := marble

# Inherit from xiaomi sm8450-common
$(call inherit-product, device/xiaomi/sm8450-common/common.mk)

# Inherit from the proprietary version
$(call inherit-product, vendor/xiaomi/marble/marble-vendor.mk)

# Call the MiuiCamera setup
$(call inherit-product-if-exists, device/xiaomi/miuicamera-marble/device.mk)

# Init scripts
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/init.marble.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/init.marble.rc

# Logging
SPAMMY_LOG_TAGS := \
    MiStcImpl \
    SDM \
    SDM-histogram \
    SRE \
    WifiHAL \
    cnss-daemon \
    libcitsensorservice@2.0-impl \
    libsensor-displayalgo \
    libsensor-parseRGB \
    libsensor-ssccalapi \
    sensors \
    vendor.qti.hardware.display.composer-service \
    vendor.xiaomi.sensor.citsensorservice@2.0-service

ifneq ($(TARGET_BUILD_VARIANT),eng)
PRODUCT_VENDOR_PROPERTIES += \
    $(foreach tag,$(SPAMMY_LOG_TAGS),log.tag.$(tag)=E)
endif

# Overlay
PRODUCT_PACKAGES += \
    ApertureResMarble \
    FrameworksResMarble \
    NfcResMarble \
    SettingsProviderResMarble \
    SettingsProviderResMarbleCN \
    SettingsResMarble \
    SystemUIResMarble \
    WifiResMarble \
    WifiResMarbleCN \

# Sensors
PRODUCT_PACKAGES += \
    sensors.xiaomi

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/sensors/hals.conf:$(TARGET_COPY_OUT_VENDOR)/etc/sensors/hals.conf

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# System properties
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/properties/build_CN.prop:$(TARGET_COPY_OUT_ODM)/etc/build_CN.prop \
    $(LOCAL_PATH)/properties/build_GL.prop:$(TARGET_COPY_OUT_ODM)/etc/build_GL.prop \
    $(LOCAL_PATH)/properties/build_IN.prop:$(TARGET_COPY_OUT_ODM)/etc/build_IN.prop

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/properties/build_CN.prop:$(TARGET_COPY_OUT_RECOVERY)/root/build_CN.prop \
    $(LOCAL_PATH)/properties/build_GL.prop:$(TARGET_COPY_OUT_RECOVERY)/root/build_GL.prop \
    $(LOCAL_PATH)/properties/build_IN.prop:$(TARGET_COPY_OUT_RECOVERY)/root/build_IN.prop
