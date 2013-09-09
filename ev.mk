# Inherit AOSP device configuration for primoc.
$(call inherit-product, device/htc/primoc/full_primoc.mk)

# Inherit some common ev stuff.
$(call inherit-product, vendor/ev/config/common_full_phone.mk)

# Inherit some common ev stuff.
$(call inherit-product, vendor/ev/config/cdma.mk)

PRODUCT_NAME := ev_primoc
PRODUCT_BRAND := htc
PRODUCT_DEVICE := primoc
PRODUCT_MODEL := PK7630000
PRODUCT_MANUFACTURER := HTC
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=htc_primoc BUILD_FINGERPRINT=virgin_mobile/htc_primoc/primou:4.1.1/JRO03L/330937:user/release-keys PRIVATE_BUILD_DESC="4.1.1 JRO03L 330937 release-keys"

# Set up the product codename, build version & MOTD.
PRODUCT_CODENAME := Quanto
PRODUCT_VERSION_DEVICE_SPECIFIC := p1

PRODUCT_MOTD :="\n\n\n--------------------MESSAGE---------------------\nThank you for choosing Evervolv for your PrimoC\nPlease visit us at \#evervolv on irc.freenode.net\nFollow @jmz_spftware for the latest Evervolv updates\nGet the latest rom at evervolv.com\n------------------------------------------------\n"

# Hot reboot
PRODUCT_PACKAGE_OVERLAYS += \
    vendor/ev/overlay/hot_reboot

# Copy compatible prebuilt files
PRODUCT_COPY_FILES +=  \
    vendor/ev/prebuilt/wvga/media/bootanimation.zip:system/media/bootanimation.zip
