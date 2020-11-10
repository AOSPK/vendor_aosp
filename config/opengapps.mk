# OpenGApps
$(call inherit-product, vendor/opengapps/build/opengapps-packages.mk)
GAPPS_VARIANT := nano

GAPPS_FORCE_PACKAGE_OVERRIDES := true

WITH_DEXPREOPT := true

ifndef OPENGAPPS_TYPE
    OPENGAPPS_TYPE := STABLE
endif
ifeq ($(OPENGAPPS_TYPE), ALPHA)
    GAPPS_PRODUCT_PACKAGES += \
        GoogleContacts \
        GoogleDialer \
        PrebuiltBugle
else
    GAPPS_PRODUCT_PACKAGES += \
        CalculatorGooglePrebuilt \
        CalendarGooglePrebuilt \
        DigitalWellbeing \
        GoogleCalendarSyncAdapter \
        GoogleContacts \
        GoogleDialer \
        LatinImeGoogle \
        Photos \
        PrebuiltBugle \
        PrebuiltDeskClockGoogle \
        PrebuiltGmail
endif
