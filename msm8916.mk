#
# Copyright (C) 2017 The LineageOS Project
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

# Inherit from common
$(call inherit-product, device/samsung/qcom-common/qcom-common.mk)

LOCAL_PATH := device/samsung/msm8916-common

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

CONFIG_PATH := hardware/qcom/audio-caf/msm8916/configs

# System properties
-include $(LOCAL_PATH)/system_prop.mk

# Include proprietary blobs
$(call inherit-product-if-exists, vendor/samsung/msm8916-common/msm8916-vendor.mk)

# Overlays
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# OTA scripts
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/releasetools/run_scripts.sh:install/bin/run_scripts.sh \
	$(LOCAL_PATH)/releasetools/functions.sh:install/bin/functions.sh \
	$(LOCAL_PATH)/releasetools/postvalidate/resize_system.sh:install/bin/postvalidate/resize_system.sh

# Substratum
PRODUCT_PACKAGES += \
	Substratum

# Audio
PRODUCT_PACKAGES += \
	audiod \
	audio.a2dp.default \
	audio.primary.msm8916 \
	audio.primary.default \
	audio_policy.msm8916 \
	audio.r_submix.default \
	audio.tms.default \
	audio.usb.default \
	libaudio-resampler \
	libaudioutils \
	libaudiopolicymanager \
	libqcompostprocbundle \
	libqcomvisualizer \
	libqcomvoiceprocessing \
	libqcmediaplayer \
	libqct_resampler \
	libtinyalsa \
	libtinycompress \
	tinymix \
	tinyplay \
	tinycap \
	tinypcminfo

# Bootloader-recovery
PRODUCT_PACKAGES += \
	libbootloader_message

# Bluetooth
PRODUCT_PACKAGES += \
	libbt-vendor

# Camera
PRODUCT_PACKAGES += \
	Snap \
	libmm-qcamera \
	camera.msm8916

# Touch issue workaround
PRODUCT_PACKAGES += \
	InputDisabler

# GPS
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/configs/gps/flp.conf:system/etc/flp.conf \
	$(LOCAL_PATH)/configs/gps/gps.conf:system/etc/gps.conf \
	$(LOCAL_PATH)/configs/gps/izat.conf:system/etc/izat.conf \
	$(LOCAL_PATH)/configs/gps/sap.conf:system/etc/sap.conf

# BoringSSL Hacks
PRODUCT_PACKAGES += \
	libboringssl-compat

# Libtime
PRODUCT_PACKAGES += \
	libtime_genoff

# Location, WiDi
PRODUCT_PACKAGES += \
	com.android.location.provider \
	com.android.location.provider.xml \
	com.android.media.remotedisplay \
	com.android.media.remotedisplay.xml

# Display
PRODUCT_PACKAGES += \
	copybit.msm8916 \
	gralloc.msm8916 \
	hwcomposer.msm8916 \
	libtinyxml \
	libtinyxml2 \
	memtrack.msm8916

# Ebtables
PRODUCT_PACKAGES += \
	ebtables \
	ethertypes \
	libebtc

# libxml2
PRODUCT_PACKAGES += \
	libxml2

# Keystore
PRODUCT_PACKAGES += \
	keystore.msm8916

# healthd
PRODUCT_PACKAGES += \
	libhealthd.cm

# Power HAL
PRODUCT_PACKAGES += \
	power.qcom

# Lights
PRODUCT_PACKAGES += \
	lights.msm8916

# Sensors
PRODUCT_PACKAGES += \
	sensors.default

# Keylayout
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/keylayout/sec_touchkey.kl:system/usr/keylayout/sec_touchkey.kl \
	$(LOCAL_PATH)/keylayout/sec_touchscreen.kl:system/usr/keylayout/sec_touchscreen.kl \
	$(LOCAL_PATH)/keylayout/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl

# Media configurations
PRODUCT_COPY_FILES += \
	frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
	frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:system/etc/media_codecs_google_telephony.xml \
	frameworks/av/media/libstagefright/data/media_codecs_google_video_le.xml:system/etc/media_codecs_google_video_le.xml

# Permissions
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
	frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
	frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
	frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
	frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
	frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
	frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
	frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
	frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
	frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
	frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml

# Ramdisk
PRODUCT_PACKAGES += \
	fstab.qcom \
	init.carrier.rc \
	init.class_main.sh \
	init.mdm.sh \
	init.link_ril_db.sh \
	init.qcom.audio.sh \
	init.qcom.bt.sh \
	init.qcom.uicc.sh \
	init.qcom.wifi.sh \
	init.qcom.post_boot.sh \
	init.qcom.class_core.sh \
	init.qcom.early_boot.sh \
	init.qcom.syspart_fixup.sh \
	init.qcom.usb.rc \
	init.qcom.usb.sh \
	init.qcom.rc \
	init.qcom.sh \
	ueventd.qcom.rc

# FS
PRODUCT_PACKAGES += \
	fsck.f2fs \
	mkfs.f2fs

# Misc
PRODUCT_PACKAGES += \
	libcurl \
	libstlport \
	rmnetcli \
	librmnetctl \
	Stk

# OMX
PRODUCT_PACKAGES += \
	libextmedia_jni \
	libqcmediaplayer \
	libOmxVidcCommon \
	libOmxAacEnc \
	libOmxAmrEnc \
	libOmxCore \
	libOmxEvrcEnc \
	libOmxQcelp13Enc \
	libOmxVdec \
	libOmxVdecHevc \
	libOmxVenc \
	libstagefrighthw

# Audio configuration
PRODUCT_COPY_FILES += \
	$(CONFIG_PATH)/msm8916_32/audio_policy.conf:system/etc/audio_policy.conf \
	$(CONFIG_PATH)/msm8916_32/audio_policy.conf:system/etc/audio_policy.conf \
	$(CONFIG_PATH)/msm8916_32/audio_effects.conf:system/vendor/etc/audio_effects.conf \
	$(CONFIG_PATH)/msm8916_32/mixer_paths_mtp.xml:system/etc/mixer_paths_mtp.xml \
	$(CONFIG_PATH)/msm8916_32/mixer_paths_sbc.xml:system/etc/mixer_paths_sbc.xml \
	$(CONFIG_PATH)/msm8916_32/mixer_paths_qrd_skuh.xml:system/etc/mixer_paths_qrd_skuh.xml \
	$(CONFIG_PATH)/msm8916_32/mixer_paths_qrd_skui.xml:system/etc/mixer_paths_qrd_skui.xml \
	$(CONFIG_PATH)/msm8916_32/mixer_paths_qrd_skuhf.xml:system/etc/mixer_paths_qrd_skuhf.xml \
	$(CONFIG_PATH)/msm8916_32/mixer_paths_wcd9306.xml:system/etc/mixer_paths_wcd9306.xml \
	$(CONFIG_PATH)/msm8916_32/mixer_paths_skuk.xml:system/etc/mixer_paths_skuk.xml \
	$(CONFIG_PATH)/msm8916_32/mixer_paths_skul.xml:system/etc/mixer_paths_skul.xml \
	$(CONFIG_PATH)/msm8916_32/sound_trigger_mixer_paths.xml:system/etc/sound_trigger_mixer_paths.xml \
	$(CONFIG_PATH)/msm8916_32/sound_trigger_mixer_paths_wcd9306.xml:system/etc/sound_trigger_mixer_paths_wcd9306.xml \
	$(CONFIG_PATH)/msm8916_32/sound_trigger_platform_info.xml:system/etc/sound_trigger_platform_info.xml \
	$(CONFIG_PATH)/msm8916_32/mixer_paths_wcd9330.xml:system/etc/mixer_paths_wcd9330.xml \
	$(LOCAL_PATH)/audio/configs/audio_platform_info.xml:system/etc/audio_platform_info.xml \
	$(LOCAL_PATH)/configs/msm_irqbalance.conf:system/vendor/etc/msm_irqbalance.conf

ifeq ($(USE_QCOM_MIXER_PATHS), 1)
PRODUCT_COPY_FILES += \
	$(CONFIG_PATH)/msm8916_32/mixer_paths.xml:system/etc/mixer_paths.xml
endif

# Wifi configuration files
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/configs/wifi/hostapd.accept:system/etc/hostapd/hostapd.accept \
	$(LOCAL_PATH)/configs/wifi/hostapd_default.conf:system/etc/hostapd/hostapd_default.conf \
	$(LOCAL_PATH)/configs/wifi/hostapd.deny:system/etc/hostapd/hostapd.deny \
	$(LOCAL_PATH)/configs/wifi/p2p_supplicant_overlay.conf:system/etc/wifi/p2p_supplicant_overlay.conf \
	$(LOCAL_PATH)/configs/wifi/wpa_supplicant_overlay.conf:system/etc/wifi/wpa_supplicant_overlay.conf \
	$(LOCAL_PATH)/configs/wifi/WCNSS_cfg.dat:system/etc/firmware/wlan/prima/WCNSS_cfg.dat \
	$(LOCAL_PATH)/configs/wifi/WCNSS_qcom_cfg.ini:system/etc/firmware/wlan/prima/WCNSS_qcom_cfg.ini \
	$(LOCAL_PATH)/configs/wifi/WCNSS_qcom_wlan_nv.bin:system/etc/firmware/wlan/prima/WCNSS_qcom_wlan_nv.bin

# Security configuration file
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/configs/sec_config:system/etc/sec_config

# Data configuration files
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/configs/data/dsi_config.xml:system/etc/data/dsi_config.xml \
	$(LOCAL_PATH)/configs/data/netmgr_config.xml:system/etc/data/netmgr_config.xml \
	$(LOCAL_PATH)/configs/data/qmi_config.xml:system/etc/data/qmi_config.xml

# Wifi
PRODUCT_PACKAGES += \
	libqsap_sdk \
	libwcnss_qmi \
	libQWiFiSoftApCfg \
	hostapd \
	wcnss_service \
	libwpa_client \
	wpa_supplicant \
	wpa_supplicant.conf
	
# FM
PRODUCT_PACKAGES += \
	FM2 \
	libqcomfm_jni \
	qcom.fmradio
	
# CRDA
PRODUCT_PACKAGES += \
	crda \
	linville.key.pub.pem \
	regdbdump \
	regulatory.bin

# We have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# Default property overrides
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp \
    persist.sys.isUsbOtgEnabled=true
