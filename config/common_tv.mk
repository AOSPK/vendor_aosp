# Inherit common custom stuff
$(call inherit-product, vendor/aosp/config/common.mk)

# Inherit custom atv device tree
$(call inherit-product, device/custom/atv/custom_atv.mk)

# AOSP packages
PRODUCT_PACKAGES += \
    LeanbackIME

# Lineage packages
PRODUCT_PACKAGES += \
    LineageCustomizer

DEVICE_PACKAGE_OVERLAYS += vendor/aosp/overlay/tv
