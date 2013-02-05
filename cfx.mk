# Inherit AOSP device configuration for primoc.
$(call inherit-product, device/htc/primoc/device.mk)

# Inherit some common CFX stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit some common CFX stuff.
$(call inherit-product, vendor/cm/config/cdma.mk)

# Copy Bootanimation
PRODUCT_COPY_FILES += \
    vendor/cm/prebuilt/common/bootanimation/480.zip:system/media/bootanimation.zip

PRODUCT_NAME := cfx_primoc
PRODUCT_BRAND := htc
PRODUCT_DEVICE := primoc
PRODUCT_MODEL := One V
PRODUCT_MANUFACTURER := HTC
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=htc_primoc BUILD_FINGERPRINT=virgin_mobile/htc/primoc:4.2.1/JOP40G/330937:user/user-debug PRIVATE_BUILD_DESC="4.2.1 JOP40G 330937 user-debug"
