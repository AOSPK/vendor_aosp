# CustomPlatform Display Version
ADDITIONAL_BUILD_PROPERTIES += \
    ro.custom.display.version=$(CUSTOM_DISPLAY_VERSION)

# CustomPlatform SDK Version
ADDITIONAL_BUILD_PROPERTIES += \
    ro.custom.build.version.plat.sdk=$(CUSTOM_PLATFORM_SDK_VERSION)

# CustomPlatform Internal Version
ADDITIONAL_BUILD_PROPERTIES += \
    ro.custom.build.version.plat.rev=$(CUSTOM_PLATFORM_REV)

# Kraken Verion
ADDITIONAL_BUILD_PROPERTIES += \
    ro.custom.version=$(CUSTOM_VERSION) \
    ro.custom.releasetype=$(CUSTOM_BUILD_TYPE) \
    ro.custom.build.version=$(CUSTOM_ANDROID_VERSION) \
    ro.modversion=$(CUSTOM_VERSION) \
    ro.custom.display.version=$(CUSTOM_FULL_VERSION)-$(CUSTOM_BUILD_DATE)-$(CUSTOM_BUILD_TYPE) \
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

ifeq ($(CUSTOM_BUILD_TYPE),OFFICIAL)
    CUSTOM_MAINTAINER ?= Unknown
    ADDITIONAL_BUILD_PROPERTIES += \
        ro.custom.maintainer=$(CUSTOM_MAINTAINER)
else
    ADDITIONAL_BUILD_PROPERTIES += \
        ro.custom.maintainer=$(CUSTOM_MAINTAINER)
endif
