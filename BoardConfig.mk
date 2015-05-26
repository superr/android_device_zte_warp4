USE_CAMERA_STUB := true

# inherit from the proprietary version
-include vendor/zte/warp4/BoardConfigVendor.mk

LOCAL_PATH := device/zte/warp4

# platform
TARGET_ARCH := arm
TARGET_BOARD_PLATFORM := msm8926
TARGET_BOARD_PLATFORM_GPU := qcom-adreno305
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_VARIANT := krait
TARGET_CPU_SMP := true
ARCH_ARM_HAVE_TLS_REGISTER := true

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := MSM8926
TARGET_NO_BOOTLOADER := true

# kernel
BOARD_KERNEL_CMDLINE := console=ttyHSL0,115200,n8 androidboot.console=ttyHSL0 androidboot.hardware=qcom user_debug=31 msm_rtb.filter=0x37 androidboot.selinux=permissive
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_SEPARATED_DT := true
TARGET_KERNEL_SOURCE := kernel/zte/warp4
TARGET_KERNEL_CONFIG := warp4_defconfig
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x01000000 --tags_offset 0x00000100
#TARGET_PREBUILT_KERNEL := $(LOCAL_PATH)/kernel
#BOARD_MKBOOTIMG_ARGS := --dt $(LOCAL_PATH)/dt.img

# partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16777216
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1610612736
BOARD_USERDATAIMAGE_PARTITION_SIZE := 4840226816
BOARD_CACHEIMAGE_PARTITION_SIZE := 838860800
BOARD_FLASH_BLOCK_SIZE := 131072

# vold
BOARD_VOLD_DISC_HAS_MULTIPLE_MAJORS := true
BOARD_VOLD_EMMC_SHARES_DEV_MAJOR := true
BOARD_VOLD_MAX_PARTITIONS := 40
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/msm_hsusb/gadget/lun%d/file

# recovery
TARGET_RECOVERY_FSTAB := $(LOCAL_PATH)/rootdir/etc/fstab.qcom
COMMON_GLOBAL_CFLAGS += -DNO_SECURE_DISCARD
BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_15x24.h\"
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_RECOVERY_SWIPE := true

# TWRP
DEVICE_RESOLUTION := 720x1280
TW_IGNORE_MAJOR_AXIS_0 := true
RECOVERY_GRAPHICS_USE_LINELENGTH := true
TW_DEFAULT_EXTERNAL_STORAGE := true
# TARGET_RECOVERY_INITRC := $(LOCAL_PATH)/ramdisk/init.rc

BOARD_HAS_NO_SELECT_BUTTON := true
