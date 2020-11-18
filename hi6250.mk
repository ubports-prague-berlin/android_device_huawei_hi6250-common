#
# Copyright (C) 2018 The LineageOS Project
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

$(call inherit-product, vendor/huawei/hi6250-common/hi6250-common-vendor.mk)
$(call inherit-product, vendor/vndk/vndk.mk)

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay \
    $(LOCAL_PATH)/overlay-lineage

# Apex
PRODUCT_COPY_FILES += \
    frameworks/av/apex/mediaswcodec.rc:system/etc/init/mediaswcodec-treble.rc

# Audio
PRODUCT_COPY_FILES += \
    frameworks/av/services/audiopolicy/config/usb_audio_policy_configuration.xml:system/etc/usb_audio_policy_configuration.xml

# Bluetooth
PRODUCT_PACKAGES += \
    libbt-vendor

# Device init scripts
PRODUCT_PACKAGES += \
    init-apex-setup.rc \
    init.bcm43xx.rc \
    init.hisi.rc \
    init.hi6250.rc \
    init.hi6250.ab.rc \
    init.hi6250.environ.rc

# Display
PRODUCT_PACKAGES += \
    libion

# GPS
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/gps/gps.conf:system/etc/gps.conf

# HIDL
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/compatibility_matrix.xml:system/compatibility_matrix.xml

PRODUCT_PACKAGES += \
    android.hidl.base@1.0 \
    android.hidl.manager@1.0

# Input
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/keylayout/fingerprint.kl:system/usr/keylayout/fingerprint.kl

# NFC
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/nfc/libnfc_brcm_pra_L31.conf:system/etc/libnfc-brcm.conf \
    $(LOCAL_PATH)/nfc/libnfc-nci.conf:system/etc/libnfc-nci.conf \
    $(LOCAL_PATH)/nfc/libnfc_nxp_pra_L31.conf:system/etc/libnfc-nxp.conf \
    $(LOCAL_PATH)/nfc/nfcscc_access.xml:system/etc/nfcscc_access.xml \
    $(LOCAL_PATH)/nfc/nfcse_access.xml:system/etc/nfcse_access.xml \

PRODUCT_PACKAGES += \
    NfcNci \
    Tag \
    com.android.nfc_extras \
    nfc_nci.pn54x.default

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:system/etc/permissions/android.hardware.fingerprint.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.nfc.hce.xml:system/etc/permissions/android.hardware.nfc.hce.xml \
    frameworks/native/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml

# Properties
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.build.version.all_codenames=$(PLATFORM_VERSION_ALL_CODENAMES) \
    ro.build.version.codename=$(PLATFORM_VERSION_CODENAME) \
    ro.build.version.huawei=8.0.0 \
    ro.build.version.huawei1=8.1.0 \
    ro.build.version.release=$(PLATFORM_VERSION) \
    ro.build.version.sdk=$(PLATFORM_SDK_VERSION) \
    ro.build.version.security_patch_sys=$(PLATFORM_SECURITY_PATCH) \
    ro.cust.cdrom=/dev/null

# Radio
#PRODUCT_PACKAGES += \
#    qti-telephony-common

#PRODUCT_BOOT_JARS += \
#    telephony-ext

# Recovery
PRODUCT_PACKAGES += \
    resize2fs_static

# Release tools
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/releasetools/releasetools.hi6250.sh:$(TARGET_COPY_OUT_SYSTEM)/bin/releasetools.hi6250.sh

# Remove unwanted packages
PRODUCT_PACKAGES += \
    RemovePackages

# Shims
PRODUCT_PACKAGES += \
    libshims_hisupl \
    libshims_hwsmartdisplay_jni

# VNDK
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/vndk-compat/ld.config.26.txt:system/etc/ld.config.26.txt

PRODUCT_COPY_FILES += \
    build/make/target/product/gsi/init.gsi.rc:system/etc/init/init.gsi.rc \
    build/make/target/product/gsi/init.vndk-27.rc:system/etc/init/gsi/init.vndk-27.rc

# Wi-Fi
PRODUCT_PACKAGES += \
    android.hardware.wifi.hostapd@1.0 \
    android.hardware.wifi@1.2

# Zygote
PRODUCT_COPY_FILES += \
	system/core/rootdir/init.zygote32.rc:system/etc/init/zygote/init.zygote32.rc \
	system/core/rootdir/init.zygote32_64.rc:system/etc/init/zygote/init.zygote32_64.rc \
	system/core/rootdir/init.zygote64_32.rc:system/etc/init/zygote/init.zygote64_32.rc \
	system/core/rootdir/init.zygote64.rc:system/etc/init/zygote/init.zygote64.rc
