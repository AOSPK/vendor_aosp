# Kraken version
KRAKEN_MOD_VERSION = 12.1
KRAKEN_MOD_VERSION_PROP = twelve
KRAKEN_BUILD_TYPE ?= UNOFFICIAL
KRAKEN_BUILD_DATE = $(shell date +"%Y%m%d-%H%M")
KRAKEN_BETA := false
KRAKEN_VANILLA ?= false
TARGET_USE_LAWNCHAIR ?= false

# Build type
ifeq ($(KRAKEN_VANILLA), true)
    KRAKEN_GAPPS := false
    KRAKEN_BUILD_ZIP_TYPE := Vanilla
else
    KRAKEN_GAPPS := true
    KRAKEN_BUILD_ZIP_TYPE := GApps
    $(call inherit-product, vendor/gapps/common/common-vendor.mk)
endif

CURRENT_DEVICE=$(shell echo "$(TARGET_PRODUCT)" | cut -d'_' -f 2,3)

# Version
ifeq ($(KRAKEN_BETA), true)
    KRAKEN_VERSION := Kraken-$(KRAKEN_MOD_VERSION)-$(KRAKEN_BUILD_ZIP_TYPE)-$(KRAKEN_BUILD_DATE)-$(CURRENT_DEVICE)-BETA-UNOFFICIAL
else ifeq ($(KRAKEN_BUILD_TYPE), OFFICIAL)
    KRAKEN_VERSION := Kraken-$(KRAKEN_MOD_VERSION)-$(KRAKEN_BUILD_ZIP_TYPE)-$(KRAKEN_BUILD_DATE)-$(CURRENT_DEVICE)
else
    KRAKEN_VERSION := Kraken-$(KRAKEN_MOD_VERSION)-$(KRAKEN_BUILD_ZIP_TYPE)-$(KRAKEN_BUILD_DATE)-$(CURRENT_DEVICE)-UNOFFICIAL
endif

# Props
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
  ro.kraken.version=$(KRAKEN_VERSION) \
  ro.kraken.releasetype=$(KRAKEN_BUILD_TYPE) \
  ro.kraken.device=$(CURRENT_DEVICE) \
  ro.kraken.ziptype=$(shell echo $(KRAKEN_BUILD_ZIP_TYPE) | tr A-Z a-z) \
  ro.modversion=$(KRAKEN_MOD_VERSION)

KRAKEN_DISPLAY_VERSION := Kraken-$(KRAKEN_MOD_VERSION)-$(KRAKEN_BUILD_TYPE)

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
  ro.kraken.display.version=$(KRAKEN_DISPLAY_VERSION)
