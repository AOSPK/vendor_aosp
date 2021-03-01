# Inherit common mobile stuff
$(call inherit-product, vendor/aosp/config/common.mk)

# Default notification/alarm sounds
PRODUCT_PRODUCT_PROPERTIES += \
    ro.config.notification_sound=Rhea.ogg \
    ro.config.alarm_alert=Oxygen.ogg

# AOSP packages
PRODUCT_PACKAGES += \
    ExactCalculator \
    Exchange2

ifeq ($(PRODUCT_TYPE), go)
PRODUCT_PACKAGES += \
    Launcher3QuickStepGo

PRODUCT_DEXPREOPT_SPEED_APPS += \
    Launcher3QuickStepGo
else
PRODUCT_PACKAGES += \
    Launcher3QuickStep

PRODUCT_DEXPREOPT_SPEED_APPS += \
    Launcher3QuickStep
endif

ifeq ($(VANILLA_BUILD), true)
    PRODUCT_PACKAGES += \
        Jelly
else

# Accents
PRODUCT_PACKAGES += \
    CustomBlackTheme \
    CustomBlackAccent \
    CustomBlueAccent \
    CustomBrownAccent \
    CustomCyanAccent \
    CustomGreenAccent \
    CustomOrangeAccent \
    CustomPinkAccent \
    CustomPurpleAccent \
    CustomRedAccent \
    CustomYellowAccent

# Charger
PRODUCT_PACKAGES += \
    charger_res_images

# Customizations
PRODUCT_PACKAGES += \
    IconShapeSquareOverlay \
    CustomNavigationBarNoHint \
    NavigationBarMode2ButtonOverlay

# Media
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    media.recorder.show_manufacturer_and_model=true

# SystemUI plugins
PRODUCT_PACKAGES += \
    QuickAccessWallet
