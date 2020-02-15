# Release name
PRODUCT_RELEASE_NAME := gtaxllte

# Inherit from the common Open Source product configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)

# Inherit from our custom product configuration
$(call inherit-product, vendor/pb/config/common.mk)

PRODUCT_PACKAGES += \
	charger_res_images \
	charger

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := gtaxllte
PRODUCT_MODEL := SM-T585
PRODUCT_NAME := omni_gtaxllte
PRODUCT_BRAND := samsung
PRODUCT_MANUFACTURER := samsung

ifeq ($(TARGET_PREBUILT_KERNEL),)
LOCAL_KERNEL := device/samsung/gtaxllte/Image
else
LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

ifeq ($(TARGET_PREBUILT_DTB),)
LOCAL_KERNEL_DTB := device/samsung/gtaxllte/dtb.img
else
LOCAL_KERNEL_DTB := $(TARGET_PREBUILT_DTB)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel \
    $(LOCAL_KERNEL_DTB):dt.img
