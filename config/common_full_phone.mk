# Inherit full common stuff
$(call inherit-product, vendor/aosp/config/common_full.mk)

# Required packages
PRODUCT_PACKAGES += \
    LatinIME

# Include LatinIME dictionaries
PRODUCT_PACKAGES += \
    KrakenLatinIMEOverlay

$(call inherit-product, vendor/aosp/config/telephony.mk)
