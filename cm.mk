# Inherit AOSP device configuration for primoc.
$(call inherit-product, device/htc/primoc/device.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

PRODUCT_NAME := cm_primoc
PRODUCT_BRAND := htc
PRODUCT_DEVICE := primoc
PRODUCT_MODEL := One V
PRODUCT_MANUFACTURER := HTC
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=htc_primoc BUILD_FINGERPRINT=virgin_mobile/htc_primoc/primoc:$(PLATFORM_VERSION)/$(BUILD_ID)/$(shell date +%Y%m%d%H%M%S):$(TARGET_BUILD_VARIANT)/user-debug PRIVATE_BUILD_DESC="$(PLATFORM_VERSION) $(BUILD_ID) $(shell date +%Y%m%d%H%M%S) user-debug"

