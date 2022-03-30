# Copyright (C) 2016 The Pure Nexus Project
# Copyright (C) 2016 The JDCTeam
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

KRAKEN_MOD_VERSION = v12.1
KRAKEN_BUILD_TYPE := UNOFFICIAL
KRAKEN_BUILD_ZIP_TYPE := VANILLA

ifeq ($(KRAKEN_BETA),true)
    KRAKEN_BUILD_TYPE := BETA
endif

ifeq ($(KRAKEN_GAPPS), true)
    $(call inherit-product, vendor/gapps/common/common-vendor.mk)
    KRAKEN_BUILD_ZIP_TYPE := GAPPS
endif

CURRENT_DEVICE=$(shell echo "$(TARGET_PRODUCT)" | cut -d'_' -f 2,3)

KRAKEN_VERSION := Kraken-$(KRAKEN_MOD_VERSION)-$(CURRENT_DEVICE)-$(KRAKEN_BUILD_TYPE)-$(shell date -u +%Y%m%d)-$(KRAKEN_BUILD_ZIP_TYPE)

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
  ro.kraken.version=$(KRAKEN_VERSION) \
  ro.kraken.releasetype=$(KRAKEN_BUILD_TYPE) \
  ro.kraken.ziptype=$(KRAKEN_BUILD_ZIP_TYPE) \
  ro.modversion=$(KRAKEN_MOD_VERSION)

KRAKEN_DISPLAY_VERSION := Kraken-$(KRAKEN_MOD_VERSION)-$(KRAKEN_BUILD_TYPE)

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
  ro.kraken.display.version=$(KRAKEN_DISPLAY_VERSION)
