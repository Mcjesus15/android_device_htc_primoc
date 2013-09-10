#
# Copyright (C) 2011 The CyanogenMod Project
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

# common msm7x30 configs
$(call inherit-product, device/htc/msm7x30-common/msm7x30.mk)

# GPS config
PRODUCT_COPY_FILES += device/htc/primoc/configs/gps.conf:system/etc/gps.conf

# Ramdisk
PRODUCT_COPY_FILES += \
    device/htc/primoc/ramdisk/init.primoc.rc:root/init.primoc.rc \
    device/htc/primoc/ramdisk/ueventd.primoc.rc:root/ueventd.primoc.rc \
    device/htc/primoc/ramdisk/fstab.primoc:root/fstab.primoc

# Vendor
$(call inherit-product-if-exists, vendor/htc/primoc/primoc-vendor.mk)

# Misc. property overrides
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.locationfeatures=1 \
    ro.com.google.networklocation=1 \
    ro.com.google.gmsversion=2.3_r3 \
    dalvik.vm.lockprof.threshold=500 \
    dalvik.vm.dexopt-flags=m=y \
    ro.sf.lcd_density=240
	
# Carrier Info
CDMA_GOOGLE_BASE := android-virgin-us
CDMA_CARRIER_ALPHA := Virgin_Mobile
CDMA_CARRIER_NUMERIC := 311490

# Property Overides for carrier
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=android-htc \
    ro.com.google.clientidbase.gmm=android-htc \
    ro.com.google.clientidbase.yt=$(CDMA_GOOGLE_BASE) \
    ro.com.google.clientidbase.am=$(CDMA_GOOGLE_BASE) \
    ro.com.google.clientidbase.ms=$(CDMA_GOOGLE_BASE) \
    ro.cdma.home.operator.alpha=$(CDMA_CARRIER_ALPHA) \
    ro.cdma.home.operator.numeric=$(CDMA_CARRIER_NUMERIC) \
    gsm.sim.operator.alpha=$(CDMA_CARRIER_ALPHA) \
    gsm.sim.operator.numeric=$(CDMA_CARRIER_NUMERIC) \
    gsm.operator.alpha=$(CDMA_CARRIER_ALPHA) \
    gsm.operator.numeric=$(CDMA_CARRIER_NUMERIC)

# Override /proc/sys/vm/dirty_ratio on UMS
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vold.umsdirtyratio=20

DEVICE_PACKAGE_OVERLAYS += device/htc/primoc/overlay


PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml

# GPS / BT / Lights / Sensors
PRODUCT_PACKAGES += \
    libbt-vendor \
    gps.primoc \
    librpc \
    lights.primoc \
    sensors.primoc

# CFX Packages
PRODUCT_PACKAGES += \
    Torch \
    make_ext4fs \
    FileManager \
    e2fsck \
    setup_fs

# Input device config
PRODUCT_COPY_FILES += \
    device/htc/primoc/idc/himax-touchscreen.idc:system/usr/idc/himax-touchscreen.idc \
    device/htc/primoc/idc/primoc-keypad.idc:system/usr/idc/primoc-keypad.idc \
    device/htc/primoc/idc/qwerty.idc:system/usr/idc/qwerty.idc \
    device/htc/primoc/idc/qwerty2.idc:system/usr/idc/qwerty2.idc \
    device/htc/primoc/idc/synaptics-rmi-touchscreen.idc:system/usr/idc/synaptics-rmi-touchscreen.idc

# Keylayouts and keychars
PRODUCT_COPY_FILES += \
    device/htc/primoc/keylayout/keychars/Generic.kcm:system/usr/keychars/Generic.kcm \
    device/htc/primoc/keylayout/keychars/qwerty.kcm:system/usr/keychars/qwerty.kcm \
    device/htc/primoc/keylayout/keychars/qwerty2.kcm:system/usr/keychars/qwerty2.kcm \
    device/htc/primoc/keylayout/keychars/Virtual.kcm:system/usr/keychars/Virtual.kcm \
    device/htc/primoc/keylayout/keylayout/himax-touchscreen.kl:system/usr/keylayout/himax-touchscreen.kl \
    device/htc/primoc/keylayout/keylayout/AVRCP.kl:system/usr/keylayout/AVRCP.kl \
    device/htc/primoc/keylayout/keylayout/h2w_headset.kl:system/usr/keylayout/h2w_headset.kl \
    device/htc/primoc/keylayout/keylayout/primoc-keypad.kl:system/usr/keylayout/primoc-keypad.kl \
    device/htc/primoc/keylayout/keylayout/qwerty.kl:system/usr/keylayout/qwerty.kl \
    device/htc/primoc/keylayout/keylayout/synaptics-rmi-touchscreen.kl:system/usr/keylayout/synaptics-rmi-touchscreen.kl

# Inherit qcom proprietary blobs
$(call inherit-product, vendor/qcom/proprietary/qcom-vendor.mk)

# ACDB
PRODUCT_COPY_FILES += \
    device/htc/primoc/configs/default.acdb:system/etc/firmware/default.acdb \
    device/htc/primoc/configs/default_org.acdb:system/etc/firmware/default_org.acdb

# Audio DSP Profiles
PRODUCT_COPY_FILES += \
    device/htc/primoc/dsp/AdieHWCodec.csv:system/etc/AdieHWCodec.csv \
    device/htc/primoc/dsp/AIC3254_REG.csv:system/etc/AIC3254_REG.csv \
    device/htc/primoc/dsp/CodecDSPID.txt:system/etc/CodecDSPID.txt \
    device/htc/primoc/dsp/TPA2051_CFG.csv:system/etc/TPA2051_CFG.csv 
	

$(call inherit-product-if-exists, hardware/broadcom/wlan/bcmdhd/firmware/bcm4330/device-bcm.mk)

# BCM4330 firmware
PRODUCT_COPY_FILES += \
    device/htc/primoc/firmware/bcm4330.hcd:system/etc/firmware/bcm4330.hcd \
    device/htc/primoc/firmware/fw_bcm4330_apsta_b1.bin:system/etc/firmware/fw_bcm4330_apsta_b1.bin \
    device/htc/primoc/firmware/fw_bcm4330_apsta_b2.bin:system/etc/firmware/fw_bcm4330_apsta_b2.bin \
    device/htc/primoc/firmware/fw_bcm4330_b2.bin:system/etc/firmware/fw_bcm4330_b2.bin \
    device/htc/primoc/firmware/fw_bcm4330_b1.bin:system/etc/firmware/fw_bcm4330_b1.bin \
    device/htc/primoc/firmware/fw_bcm4330_p2p_b2.bin:system/etc/firmware/fw_bcm4330_p2p_b2.bin \
    device/htc/primoc/firmware/fw_bcm4330_p2p_b1.bin:system/etc/firmware/fw_bcm4330_p2p_b1.bin \
    device/htc/primoc/firmware/calibration:system/etc/calibration

# Bluetooth Vendor Configuration
PRODUCT_COPY_FILES += \
    device/htc/primoc/configs/bt_vendor.conf:system/etc/bluetooth/bt_vendor.conf

# HTC BT audio config
PRODUCT_COPY_FILES += \
    device/htc/primoc/configs/AudioBTID.csv:system/etc/AudioBTID.csv

# Kernel
ifeq ($(TARGET_PREBUILT_KERNEL),)
        LOCAL_KERNEL := device/htc/primoc/prebuilt/kernel/kernel

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel
endif

# Turn off ZRAM by default
PRODUCT_PROPERTY_OVERRIDES += \
    ro.zram.default=0

# HTC Audio
$(call inherit-product, device/htc/primoc/media_a1026.mk)
$(call inherit-product, device/htc/primoc/media_htcaudio.mk)

$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, frameworks/native/build/phone-hdpi-512-dalvik-heap.mk)
