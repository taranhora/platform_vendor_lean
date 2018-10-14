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

PRODUCT_BRAND ?= Lean

# Versioning System
# Lean version over here.
PRODUCT_VERSION_MAJOR = v1.0
PRODUCT_VERSION_MINOR = GuessIDontKnow
LEAN_POSTFIX := -$(shell date +"%Y%m%d")

ifndef LEAN_BUILD_TYPE
    LEAN_BUILD_TYPE := Unofficial
endif

ifdef LEAN_BUILD_EXTRA
    LEAN_POSTFIX := -$(LEAN_BUILD_EXTRA)
    LEAN_MOD_SHORT := LeanOS-$(PRODUCT_VERSION_MAJOR)-$(LEAN_BUILD)-$(LEAN_BUILD_TYPE)$(LEAN_POSTFIX)
else
    LEAN_MOD_SHORT := LeanOS-$(PRODUCT_VERSION_MAJOR)-$(LEAN_BUILD)-$(LEAN_BUILD_TYPE)
endif

LEAN_VERSION := LeanOS-$(PRODUCT_VERSION_MAJOR)-$(LEAN_BUILD)-$(LEAN_BUILD_TYPE)$(LEAN_POSTFIX)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
