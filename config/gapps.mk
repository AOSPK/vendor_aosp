# OpenGApps
$(call inherit-product, vendor/opengapps/build/opengapps-packages.mk)
GAPPS_VARIANT := nano

GAPPS_FORCE_PACKAGE_OVERRIDES := true

GAPPS_PRODUCT_PACKAGES += \
    GoogleContacts \
    GoogleDialer \
    LatinImeGoogle \
    PrebuiltDeskClockGoogle \
    PrebuiltBugle \
    WellbeingPrebuilt \
    PrebuiltBugle

PRODUCT_COPY_FILES +=  \
    vendor/aosp/prebuilt/common/sysconfig/dialer_experience.xml:system/etc/sysconfig/dialer_experience.xml

PRODUCT_PROPERTY_OVERRIDES += \
    ro.opa.eligible_device=true
