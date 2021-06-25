# Custom props
ADDITIONAL_BUILD_PROPERTIES += \
    ro.custom.version=$(CUSTOM_VERSION) \
    ro.custom.releasetype=$(CUSTOM_BUILD_TYPE) \
    ro.custom.build.version=$(CUSTOM_PLATFORM_VERSION) \
    ro.modversion=$(CUSTOM_VERSION) \
    ro.custom.display.version=$(CUSTOM_PLATFORM_VERSION)-$(CUSTOM_APPS_VERSION)-$(CUSTOM_BUILD_DATE)-$(CUSTOM_BUILD_TYPE) \
    ro.custom.device=$(CUSTOM_DEVICE) \
    ro.custom.build.date=$(CUSTOM_BUILD_DATE) \
    ro.custom.display.version=$(CUSTOM_DISPLAY_VERSION) \
    ro.custom.build.version.plat.sdk=$(CUSTOM_PLATFORM_SDK_VERSION) \
    ro.custom.build.version.plat.rev=$(CUSTOM_PLATFORM_REV)

# GMS
ifeq ($(VANILLA_BUILD), true)
ADDITIONAL_BUILD_PROPERTIES += \
    ro.custom.apps.version=vanilla
else
ADDITIONAL_BUILD_PROPERTIES += \
    ro.custom.apps.version=gapps
endif

# Check maintainer
ifeq ($(CUSTOM_BUILD_TYPE), OFFICIAL)
ifeq ($(CUSTOM_MAINTAINER),)
$(error If you are OFFICIAL, you need to define the variable with your name in your device tree, for example: CUSTOM_MAINTAINER := MyName)
endif
ADDITIONAL_BUILD_PROPERTIES += \
    ro.custom.maintainer=$(CUSTOM_MAINTAINER)
else
ADDITIONAL_BUILD_PROPERTIES += \
    ro.custom.maintainer=UNOFFICIAL
endif
