# Inherit common Lineage stuff
$(call inherit-product, vendor/aosp/config/common_mobile.mk)

PRODUCT_SIZE := full

# Recorder
PRODUCT_PACKAGES += \
    Recorder
