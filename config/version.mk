PRODUCT_PROPERTY_OVERRIDES += \
    ro.build.fingerprint=$(BUILD_FINGERPRINT)
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="$(BUILD_DESCRIPTION)"

# Version
CUSTOM_AOSP_VERSION := Kraken
CUSTOM_ANDROID_NAME := eleven
CUSTOM_ANDROID_VERSION := 11
CUSTOM_BUILD_DATE=$(shell date +"%Y%m%d-%H%M")
CUSTOM_DEVICE := $(CUSTOM_BUILD)

CUSTOM_BUILD_TYPE ?= UNOFFICIAL
VANILLA_BUILD ?= false

# GMS
ifeq ($(VANILLA_BUILD), true)
    CUSTOM_APPS_VERSION := Vanilla
else
    $(call inherit-product, vendor/gapps/common/common-vendor.mk)
    CUSTOM_APPS_VERSION := GApps
endif

CUSTOM_FULL_VERSION := $(CUSTOM_ANDROID_VERSION)-$(CUSTOM_APPS_VERSION)

ifeq ($(CUSTOM_BUILD_TYPE), OFFICIAL)
    CUSTOM_VERSION := $(CUSTOM_AOSP_VERSION)-$(CUSTOM_FULL_VERSION)-$(CUSTOM_BUILD_DATE)-$(CUSTOM_DEVICE)
    PRODUCT_PACKAGES += \
        Updater
else
    CUSTOM_VERSION := $(CUSTOM_AOSP_VERSION)-$(CUSTOM_FULL_VERSION)-$(CUSTOM_BUILD_DATE)-$(CUSTOM_DEVICE)-$(CUSTOM_BUILD_TYPE)
endif
