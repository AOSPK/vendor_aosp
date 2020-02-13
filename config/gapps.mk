# OpenGApps
$(call inherit-product, vendor/opengapps/build/opengapps-packages.mk)
GAPPS_VARIANT := nano

GAPPS_FORCE_PACKAGE_OVERRIDES := true

GAPPS_PRODUCT_PACKAGES += \
    DigitalWellbeing \
    GoogleContacts \
    GoogleDialer \
    LatinImeGoogle \
    PrebuiltBugle \
    PrebuiltDeskClockGoogle
