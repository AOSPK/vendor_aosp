# Inherit common custom stuff
$(call inherit-product, vendor/aosp/config/common.mk)

# Inherit custom atv device tree
$(call inherit-product, device/custom/atv/custom_atv.mk)

# AOSP packages
PRODUCT_PACKAGES += \
    LeanbackIME

# Packages
PRODUCT_PACKAGES += \
    TvCustomizer

# Overlays
PRODUCT_PACKAGES += \
    KrakenTvOverlay \
    KrakenTvSettingsProviderOverlay
