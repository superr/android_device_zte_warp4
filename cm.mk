## Specify phone tech before including full_phone
$(call inherit-product, vendor/cm/config/gsm.mk)

# Release name
PRODUCT_RELEASE_NAME := warp4

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/zte/warp4/device_warp4.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := warp4
PRODUCT_NAME := cm_warp4
PRODUCT_BRAND := zte
PRODUCT_MODEL := warp4
PRODUCT_MANUFACTURER := zte
