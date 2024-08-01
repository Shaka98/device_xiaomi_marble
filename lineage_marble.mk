#
# Copyright (C) 2022-2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from marble device
$(call inherit-product, device/xiaomi/marble/device.mk)

# Inherit from common Matrixx configuration
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Matrixx
MATRIXX_BUILD_TYPE := Official
MATRIXX_MAINTAINER := CHAITANYA
MATRIXX_CHIPSET := SM7475
MATRIXX_BATTERY := 5000mah
MATRIXX_DISPLAY := 1080x2400
TARGET_EXCLUDES_AUXIO := true
TARGET_EXCLUDES_VIA := true
WITH_GMS := true
BUILD_GOOGLE_CONTACTS := true
BUILD_GOOGLE_DIALER := true
BUILD_GOOGLE_MESSAGE := true
TARGET_DISABLE_EPPE := true
PRODUCT_DEFAULT_DEV_CERTIFICATE := .android-certs/releasekey

PRODUCT_NAME := lineage_marble
PRODUCT_DEVICE := marble
PRODUCT_MANUFACTURER := Xiaomi
PRODUCT_BRAND := POCO
PRODUCT_MODEL := 23049PCD8G

PRODUCT_SYSTEM_NAME := marble_global
PRODUCT_SYSTEM_DEVICE := marble

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="marble_global-user 14 UKQ1.230804.001 V816.0.8.0.UMREUXM release-keys" \
    TARGET_DEVICE=$(PRODUCT_SYSTEM_DEVICE) \
    TARGET_PRODUCT=$(PRODUCT_SYSTEM_NAME)

BUILD_FINGERPRINT := POCO/marble_global/marble:14/UKQ1.230804.001/V816.0.8.0.UMREUXM:user/release-keys

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi
