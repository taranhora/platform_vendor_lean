# Copyright (C) 2017 AospExtended ROM
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

LEAN_MOD_VERSION = 9.0

 ifeq ($(LEAN_BETA),true)
    LEAN_BUILD_TYPE := BETA
endif

 CURRENT_DEVICE=$(shell echo "$(TARGET_PRODUCT)" | cut -d'_' -f 2,3)

 LIST = $(shell curl -s https://raw.githubusercontent.com/LeanOS-Project/platform_vendor_lean/lean-9.x/lean.devices)
FOUND_DEVICE =  $(filter $(CURRENT_DEVICE), $(LIST))
ifeq ($(FOUND_DEVICE),$(CURRENT_DEVICE))
    IS_OFFICIAL=true
    LEAN_BUILD_TYPE := OFFICIAL
else
    LEAN_BUILD_TYPE := UNOFFICIAL
endif

 LEAN_VERSION := LEANOS-$(LEAN_MOD_VERSION)-$(CURRENT_DEVICE)-$(LEAN_BUILD_TYPE)-$(shell date -u +%Y%m%d)

 PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
  ro.lean.version=$(LEAN_VERSION) \
  ro.lean.releasetype=$(LEAN_BUILD_TYPE) \
  ro.mod.version=$(LEAN_MOD_VERSION)

 LEAN_DISPLAY_VERSION := LEANOS-$(LEAN_MOD_VERSION)-$(LEAN_BUILD_TYPE)

 PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
  ro.lean.display.version=$(LEAN_DISPLAY_VERSION)
