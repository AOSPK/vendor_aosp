# Inherit common Lineage stuff
$(call inherit-product, vendor/aosp/config/common.mk)

PRODUCT_SIZE := full

# Recorder
PRODUCT_PACKAGES += \
    Recorder
