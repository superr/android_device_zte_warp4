$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/zte/warp4/warp4-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/zte/warp4/overlay

LOCAL_PATH := device/zte/warp4
ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := $(LOCAL_PATH)/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

$(call inherit-product, build/target/product/full.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_warp4
PRODUCT_DEVICE := warp4

#common build.props
PRODUCT_PROPERTY_OVERRIDES += \
    persist.fuse_sdcard=true \
    persist.sys.fuse.dir=sdcard \
    
# For userdebug builds
ADDITIONAL_DEFAULT_PROPERTIES += \
    ro.secure=0 \
    ro.adb.secure=0 \
    persist.sys.usb.config=mtp
    
# Kernel Ramdisk
PRODUCT_COPY_FILES += \
$(LOCAL_PATH)/rootdir/etc/twrp.fstab:root/etc/twrp.fstab \
$(LOCAL_PATH)/ramdisk/icon_ftm.png:root/icon_ftm.png \
$(LOCAL_PATH)/ramdisk/init.class_main.sh:root/init.class_main.sh \
$(LOCAL_PATH)/ramdisk/init.ftm.rc:root/init.ftm.rc \
$(LOCAL_PATH)/ramdisk/init.mdm.sh:root/init.mdm.sh \
$(LOCAL_PATH)/ramdisk/init.qcom.class_core.sh:root/init.qcom.class_core.sh \
$(LOCAL_PATH)/ramdisk/init.qcom.early_boot.sh:root/init.qcom.early_boot.sh \
$(LOCAL_PATH)/ramdisk/init.qcom.factory.sh:root/init.qcom.factory.sh \
$(LOCAL_PATH)/ramdisk/init.qcom.ftm.rc:root/init.qcom.ftm.rc \
$(LOCAL_PATH)/ramdisk/init.qcom.rc:root/init.qcom.rc \
$(LOCAL_PATH)/ramdisk/init.recovery.qcom.rc:root/init.recovery.qcom.rc \
$(LOCAL_PATH)/ramdisk/init.qcom.ril.sh:root/init.qcom.ril.sh \
$(LOCAL_PATH)/ramdisk/init.qcom.sh:root/init.qcom.sh \
$(LOCAL_PATH)/ramdisk/init.qcom.ssr.sh:root/init.qcom.ssr.sh \
$(LOCAL_PATH)/ramdisk/init.qcom.syspart_fixup.sh:root/init.qcom.syspart_fixup.sh \
$(LOCAL_PATH)/ramdisk/init.qcom.usb.rc:root/init.qcom.usb.rc \
$(LOCAL_PATH)/ramdisk/init.qcom.usb.sh:root/init.qcom.usb.sh \
$(LOCAL_PATH)/ramdisk/init.target.rc:root/init.target.rc \
$(LOCAL_PATH)/ramdisk/sbin/trigger_modemload:root/sbin/trigger_modemload \
$(LOCAL_PATH)/ramdisk/sbin/usbconfig:root/sbin/usbconfig \
$(LOCAL_PATH)/ramdisk/ueventd.qcom.rc:root/ueventd.qcom.rc
