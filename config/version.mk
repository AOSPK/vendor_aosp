# Build fingerprint
BUILD_FINGERPRINT := google/redfin/redfin:11/RQ1A.210205.004/7038034:user/release-keys
BUILD_DESCRIPTION := redfin-user 11 RQ1A.210205.004 7038034 release-keys

PRODUCT_PROPERTY_OVERRIDES += \
    ro.build.fingerprint=$(BUILD_FINGERPRINT)
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="$(BUILD_DESCRIPTION)"

# Version
CUSTOM_AOSP_VERSION := Kraken
CUSTOM_ANDROID_NAME := eleven
CUSTOM_ANDROID_VERSION := 11
CUSTOM_BUILD_DATE=$(shell date +"%Y%m%d-%H%M")
CUSTOM_DEVICE := $(LINEAGE_BUILD)

CUSTOM_BUILD_TYPE ?= UNOFFICIAL
VANILLA_BUILD ?= false

# GMS
ifeq ($(VANILLA_BUILD), true)
    APPS_VERSION := Vanilla
else
    $(call inherit-product-if-exists, vendor/google/gms/config.mk)
    APPS_VERSION := GApps
endif

FULL_VERSION := $(CUSTOM_ANDROID_VERSION)-$(APPS_VERSION)

ifeq ($(CUSTOM_BUILD_TYPE), OFFICIAL)
    CUSTOM_VERSION := $(CUSTOM_AOSP_VERSION)-$(FULL_VERSION)-$(CUSTOM_BUILD_DATE)-$(CUSTOM_DEVICE)
#    PRODUCT_PACKAGES += \
#        Updater
else
    CUSTOM_VERSION := $(CUSTOM_AOSP_VERSION)-$(FULL_VERSION)-$(CUSTOM_BUILD_DATE)-$(CUSTOM_DEVICE)-$(CUSTOM_BUILD_TYPE)
endif

PRODUCT_PROPERTY_OVERRIDES += \
    ro.custom.version=$(CUSTOM_VERSION) \
    ro.custom.buildtype=$(CUSTOM_BUILD_TYPE) \
    ro.custom.build.date=$(CUSTOM_BUILD_DATE) \
    ro.custom.device=$(CUSTOM_DEVICE) \
    ro.custom.android.name=$(CUSTOM_ANDROID_NAME) \
    ro.custom.android.version=$(CUSTOM_ANDROID_VERSION) \
    ro.custom.apps=$(APPS_VERSION)
