# Build fingerprint
#ifneq ($(BUILD_FINGERPRINT),)
#ADDITIONAL_BUILD_PROPERTIES += \
#    ro.build.fingerprint=$(BUILD_FINGERPRINT)
#endif

# LineageOS System Version
#ADDITIONAL_BUILD_PROPERTIES += \
#    ro.lineage.version=$(LINEAGE_VERSION) \
#    ro.lineage.releasetype=$(LINEAGE_BUILDTYPE) \
#    ro.lineage.build.version=$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR) \
#    ro.modversion=$(LINEAGE_VERSION) \
#    ro.lineagelegal.url=https://lineageos.org/legal

# LineageOS Platform Display Version
ADDITIONAL_BUILD_PROPERTIES += \
    ro.lineage.display.version=$(LINEAGE_DISPLAY_VERSION)

# LineageOS Platform SDK Version
ADDITIONAL_BUILD_PROPERTIES += \
    ro.lineage.build.version.plat.sdk=$(LINEAGE_PLATFORM_SDK_VERSION)

# LineageOS Platform Internal Version
ADDITIONAL_BUILD_PROPERTIES += \
    ro.lineage.build.version.plat.rev=$(LINEAGE_PLATFORM_REV)

# Custom
ADDITIONAL_BUILD_PROPERTIES += \
    ro.custom.version=$(CUSTOM_VERSION) \
    ro.custom.releasetype=$(CUSTOM_BUILD_TYPE) \
    ro.custom.build.version=$(CUSTOM_ANDROID_VERSION) \
    ro.modversion=$(CUSTOM_VERSION) \
    ro.custom.display.version=$(CUSTOM_VERSION) \
    ro.custom.device=$(CUSTOM_DEVICE) \
    ro.custom.build.date=$(CUSTOM_BUILD_DATE)

# GMS
ifeq ($(VANILLA_BUILD), true)
    ADDITIONAL_BUILD_PROPERTIES += \
        ro.custom.apps.version=vanilla
else
    ADDITIONAL_BUILD_PROPERTIES += \
        ro.custom.apps.version=gapps
endif
