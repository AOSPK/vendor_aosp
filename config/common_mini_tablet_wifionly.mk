# Inherit mini common Lineage stuff
$(call inherit-product, vendor/aosp/config/common_mini.mk)

# Required packages
PRODUCT_PACKAGES += \
    LatinIME
