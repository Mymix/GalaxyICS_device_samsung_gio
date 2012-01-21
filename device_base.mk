# Copyright (C) 2009 The Android Open Source Project
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
# This file is the build configuration for a full Android
# build for sapphire hardware. This cleanly combines a set of
# device-specific aspects (drivers) with a device-agnostic
# product configuration (apps).
#

# Inherit from those products. Most specific first.

$(call inherit-product, device/common/gps/gps_eu_supl.mk)

DEVICE_PACKAGE_OVERLAYS += device/samsung/gio/overlay

ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := device/samsung/gio/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

## Live wallpaper packages
PRODUCT_PACKAGES += \
    LiveWallpapersPicker \
    librs_jni \
    libRS \
    hwprops \
    rzscontrol \
    Gallery \
    SpareParts \
    Development \
    Term \
    prox_cal \
    make_ext4fs \
    brcm_patchram_plus \
    gps.gio \
    gralloc.gio \
    copybit.gio \
    setup_fs \
    gralloc.gio \
    libOmxCore \
    libOmxVidEnc \
    FileManager \
    screencap \
    audio.a2dp.default \
    dexpreopt \
    abtfilt \
    hwcomposer.default \
    Stk \
    lzo \
    zipalign \
    Superuser \
    Camera

## Vold config
PRODUCT_COPY_FILES += \
    device/samsung/gio/vold.fstab:system/etc/vold.fstab

## Hardware properties 
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.location.xml:system/etc/permissions/android.hardware.location.xml \
    frameworks/base/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/base/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml

## Board-specific init
PRODUCT_COPY_FILES += \
    device/samsung/gio/ueventd.gt-s5660.rc:root/ueventd.gt-s5660.rc \
    device/samsung/gio/init.gt-s5660.usb.rc:root/init.gt-s5660.usb.rc \
    device/samsung/gio/prebuilt/fsr.ko:root/lib/modules/fsr.ko \
    device/samsung/gio/prebuilt/fsr_stl.ko:root/lib/modules/fsr_stl.ko \
    device/samsung/gio/prebuilt/rfs_fat.ko:root/lib/modules/rfs_fat.ko \
    device/samsung/gio/prebuilt/rfs_glue.ko:root/lib/modules/rfs_glue.ko \
    device/samsung/gio/prebuilt/sec_param.ko:root/lib/modules/sec_param.ko \
    device/samsung/gio/prebuilt/lzo_compress.ko:system/lib/modules/lzo_compress.ko \
    device/samsung/gio/prebuilt/lzo_decompress.ko:system/lib/modules/lzo_decompress.ko \
    device/samsung/gio/GIO.rle:root/GIO.rle \
    device/samsung/gio/init.gt-s5660.rc:root/init.gt-s5660.rc \
    device/samsung/gio/prebuilt/ramzswap.ko:system/lib/modules/ramzswap.ko 

## wifi module
PRODUCT_COPY_FILES += \
    device/samsung/gio/prebuilt/ar6000.ko:system/wifi/ar6000.ko \
    device/samsung/gio/prebuilt/athtcmd_ram.bin:system/wifi/ath6k/AR6003/hw2.0/athtcmd_ram.bin \
    device/samsung/gio/prebuilt/athwlan.bin.z77:system/wifi/ath6k/AR6003/hw2.0/athwlan.bin.z77 \
    device/samsung/gio/prebuilt/bdata.SD31.bin:system/wifi/ath6k/AR6003/hw2.0/bdata.SD31.bin \
    device/samsung/gio/prebuilt/bdata.SD31.bin.01:system/wifi/ath6k/AR6003/hw2.0/bdata.SD31.bin.01 \
    device/samsung/gio/prebuilt/bdata.SD31.bin.02:system/wifi/ath6k/AR6003/hw2.0/bdata.SD31.bin.02 \
    device/samsung/gio/prebuilt/bdata.SD31.bin.03:system/wifi/ath6k/AR6003/hw2.0/bdata.SD31.bin.03 \
    device/samsung/gio/prebuilt/data.patch.bin:system/wifi/ath6k/AR6003/hw2.0/data.patch.bin \
    device/samsung/gio/prebuilt/otp.bin.z77:system/wifi/ath6k/AR6003/hw2.0/otp.bin.z77 \
    device/samsung/gio/prebuilt/hostapd:system/bin/hostapd \
    device/samsung/gio/prebuilt/wlan_mac:system/bin/wlan_mac \
    device/samsung/gio/prebuilt/wlan_tool:system/bin/wlan_tool \
    device/samsung/gio/prebuilt/wmiconfig:system/bin/wmiconfig 

## Wifi Stuff
PRODUCT_COPY_FILES += \
    device/samsung/gio/prebuilt/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    device/samsung/gio/prebuilt/hostapd.conf:system/etc/wifi/hostapd.conf \
    device/samsung/gio/prebuilt/dhcpcd.conf:system/etc/wifi/dhcpcd.conf \
    device/samsung/gio/dhcpcd.conf:system/etc/dhcpcd/dhcpcd.conf 

## Media
PRODUCT_COPY_FILES += \
    device/samsung/gio/prebuilt/audio.primary.gio.so:system/lib/hw/audio.primary.gio.so\
    device/samsung/gio/prebuilt/audio_policy.gio.so:system/lib/hw/audio_policy.gio.so\
    device/samsung/gio/prebuilt/AutoVolumeControl.txt:system/etc/AutoVolumeControl.txt \
    device/samsung/gio/prebuilt/AudioFilter.csv:system/etc/AudioFilter.csv \
    device/samsung/gio/prebuilt/audio_effects.conf:system/etc/audio_effects.conf \
    device/samsung/gio/prebuilt/apns-conf.xml:system/etc/apns-conf.xml \
    device/samsung/gio/prebuilt/hosts:system/etc/hosts \
    device/samsung/gio/prebuilt/init.local.rc:system/etc/init.local.rc \
    device/samsung/gio/prebuilt/sysctl.conf:system/etc/sysctl.conf \
    device/samsung/gio/prebuilt/media_profiles.xml:system/etc/media_profiles.xml 

## keymap
PRODUCT_COPY_FILES += \
    device/samsung/gio/prebuilt/qwerty.kl:system/usr/keylayout/qwerty.kl \
    device/samsung/gio/prebuilt/sec_jack.kl:system/usr/keylayout/sec_jack.kl \
    device/samsung/gio/prebuilt/Generic.kl:system/usr/keylayout/Generic.kl \
    device/samsung/gio/prebuilt/AVRCP.kl:system/usr/keylayout/AVRCP.kl \
    device/samsung/gio/prebuilt/sec_key.kl:system/usr/keylayout/sec_key.kl 

## keychar
PRODUCT_COPY_FILES += \
    device/samsung/gio/prebuilt/qwerty.kcm:system/usr/keylayout/qwerty.kcm \
    device/samsung/gio/prebuilt/qwerty2.kcm:system/usr/keylayout/qwerty2.kcm \
    device/samsung/gio/prebuilt/Virtual.kcm:system/usr/keylayout/Virtual.kcm \
    device/samsung/gio/prebuilt/Generic.kcm:system/usr/keylayout/Generic.kcm

## Touchscreen
PRODUCT_COPY_FILES += \
    device/samsung/gio/prebuilt/sec_touchscreen.idc:system/usr/idc/sec_touchscreen.idc

## Bluetooth
PRODUCT_COPY_FILES += \
    device/samsung/gio/prebuilt/BCM2049C0_003.001.031.0088.0094.hcd:system/bin/BCM2049C0_003.001.031.0088.0094.hcd \
    device/samsung/gio/prebuilt/BCM2049C0_003.001.031.0088.0094.hcd:system/etc/firmware/BCM2049C0_003.001.031.0088.0094.hcd

## Sensor
PRODUCT_COPY_FILES += \
    device/samsung/gio/prebuilt/gpsd:system/bin/gpsd \
    device/samsung/gio/prebuilt/qmuxd:system/bin/qmuxd \
    device/samsung/gio/prebuilt/gps.msm7k.so:system/vendor/lib/hw/gps.msm7k.so \
    device/samsung/gio/prebuilt/gps.msm7k.so:system/lib/hw/gps.msm7k.so \
    device/samsung/gio/prebuilt/lights.msm7k.so:system/lib/hw/lights.msm7k.so \
    device/samsung/gio/prebuilt/sensors.default.so:system/lib/hw/sensors.default.so \
    device/samsung/gio/prebuilt/gpsd:system/vendor/bin/gpsd \
    device/samsung/gio/prebuilt/memsicd:system/bin/memsicd 

## 3D
PRODUCT_COPY_FILES += \
    device/samsung/gio/prebuilt/libGLESv1_CM_adreno200.so:system/lib/egl/libGLESv1_CM_adreno200.so \
    device/samsung/gio/prebuilt/libq3dtools_adreno200.so:system/lib/egl/libq3dtools_adreno200.so \
    device/samsung/gio/prebuilt/libEGL_adreno200.so:system/lib/egl/libEGL_adreno200.so \
    device/samsung/gio/prebuilt/libGLESv2_adreno200.so:system/lib/egl/libGLESv2_adreno200.so \
    device/samsung/gio/prebuilt/libgsl.so:system/lib/libgsl.so \
    device/samsung/gio/prebuilt/egl.cfg:system/lib/egl/egl.cfg 

## GPU firmware
PRODUCT_COPY_FILES += \
    device/samsung/gio/prebuilt/yamato_pm4.fw:system/etc/firmware/yamato_pm4.fw \
    device/samsung/gio/prebuilt/yamato_pfp.fw:system/etc/firmware/yamato_pfp.fw

## other media
PRODUCT_COPY_FILES += \
    device/samsung/gio/prebuilt/bootanimation.zip:system/media/bootanimation.zip \
    device/samsung/gio/prebuilt/bootsound:system/bin/bootsound \
    device/samsung/gio/prebuilt/get_macaddrs:system/bin/get_macaddrs \
    device/samsung/gio/prebuilt/poweron.ogg:system/media/poweron.ogg

## ril
PRODUCT_COPY_FILES += \
    device/samsung/gio/prebuilt/libdiag.so:system/lib/libdiag.so \
    device/samsung/gio/prebuilt/libsec-ril.so:system/lib/libsec-ril.so \
    device/samsung/gio/prebuilt/libsecril-client.so:system/lib/libsecril-client.so \
    device/samsung/gio/prebuilt/libril.so:system/lib/libril.so 

## script
PRODUCT_COPY_FILES += \
    device/samsung/gio/prebuilt/01sysctl:system/etc/init.d/01sysctl \
    device/samsung/gio/prebuilt/04modules:system/etc/init.d/04modules \
    device/samsung/gio/prebuilt/20userinit:system/etc/init.d/20userinit \
    device/samsung/gio/prebuilt/99complete:system/etc/init.d/99complete \
    device/samsung/gio/prebuilt/00banner:system/etc/init.d/00banner

PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true \
    ro.com.android.dateformat=dd-MM-yyyy \

# LDPI assets
PRODUCT_LOCALES += ldpi mdpi
$(call inherit-product, build/target/product/full_base.mk)

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise
