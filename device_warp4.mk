$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/zte/warp4/warp4-vendor.mk)

# DEVICE_PACKAGE_OVERLAYS += device/zte/warp4/overlay

LOCAL_PATH := device/zte/warp4
ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := $(LOCAL_PATH)/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

# DT Image
PRODUCT_COPY_FILES += \
$(LOCAL_PATH)/dt.img:dt.img \
    
$(call inherit-product, build/target/product/full.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_warp4
PRODUCT_DEVICE := warp4

# copy overrides
PRODUCT_COPY_FILES_OVERRIDES += \
    fstab.goldfish \
    ueventd.goldfish.rc

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
