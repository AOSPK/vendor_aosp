# Copyright (C) 2019 Kraken Open Tentacles Project
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

KRAKEN_VERSION := 1.2
CUSTOM_ANDROID_VERSION := Pie
CUSTOM_BUILD_DATE=$(shell date +"%Y%m%d-%H%M")
CUSTOM_DEVICE := $(LINEAGE_BUILD)

ifndef KRAKEN_BUILD_TYPE
    KRAKEN_BUILD_TYPE := UNOFFICIAL
endif
ifeq ($(KRAKEN_BUILD_TYPE), OFFICIAL)
PRODUCT_PACKAGES += \
    Updater
endif

CUSTOM_VERSION := $(CUSTOM_DEVICE)-v$(KRAKEN_VERSION)-$(CUSTOM_BUILD_DATE)-$(KRAKEN_BUILD_TYPE)

PRODUCT_PROPERTY_OVERRIDES += \
    ro.modversion=$(CUSTOM_ANDROID_VERSION) \
    ro.custom.build.version=$(CUSTOM_ANDROID_VERSION) \
    ro.custom.version=$(CUSTOM_VERSION) \
    ro.custom.buildtype=$(KRAKEN_BUILD_TYPE) \
    ro.custom.build.date=$(CUSTOM_BUILD_DATE) \
    ro.custom.device=$(CUSTOM_DEVICE)
