#
# Copyright (C) 2018-2019 The Pixel3ROM Project
# Copyright (C) 2020 Raphielscape LLC. and Haruka LLC.
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
#

BUILD_ID_LC ?= $(shell echo $(BUILD_ID) | tr '[:upper:]' '[:lower:]')

PLATFORM_SPAFF_RELEASE := DevilsMilk

ifeq ($(TARGET_BUILD_VARIANT),user)
    PLATFORM_SPAFF_VERSION := $(PLATFORM_SPAFF_RELEASE).DN.$(shell date +%m%d%H%M)
    PROD_VERSION += $(TARGET_PRODUCT)-$(PLATFORM_SPAFF_RELEASE)-ota-$(BUILD_ID_LC)-Furry.$(shell date +%m%d%H%M)
else
    PLATFORM_SPAFF_VERSION := $(PLATFORM_SPAFF_RELEASE).INT.$(shell date +%m%d%H%M)
    PROD_VERSION += $(TARGET_PRODUCT)-$(PLATFORM_SPAFF_RELEASE)-ota-$(BUILD_ID_LC)-INT.$(shell date +%m%d%H%M)
endif

PRODUCT_PRODUCT_PROPERTIES += \
    ro.system.spaff.version=$(PLATFORM_SPAFF_VERSION)

$(call inherit-product-if-exists, vendor/spaff/build/target/product/security/spaff_security.mk)

PRODUCT_HOST_PACKAGES += \
    sign_target_files_apks \
    ota_from_target_files
