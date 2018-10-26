#Lean first version.
PRODUCT_VERSION_MAJOR = 9.0
PRODUCT_VERSION_MAINTENANCE = LoL
LEAN_POSTFIX := $(shell date +"%Y%m%d")
LEAN_BUILD_EXTRA := By-Team-Lean

# Default Unofficial Tag
ifndef LEAN_BUILD_TYPE
    LEAN_BUILD_TYPE := UNOFFICIAL
endif

# Beta Tag
ifeq ($(LEAN_BETA),true)
    LEAN_BUILD_TYPE := BETA
endif

# Alpha Tag
ifeq ($(LEAN_ALPHA),true)
   LEAN_BUILD_TYPE := ALPHA
endif

# Specific Official Tag
CURRENT_DEVICE=$(shell echo "$(TARGET_PRODUCT)" | cut -d'_' -f 2,3)

ifeq ($(LEAN_OFFICIAL),true)
   LIST = $(shell curl -s https://raw.githubusercontent.com/LeanOS-Project/platform_vendor_lean/lean-9.x/lean.devices)
   FOUND_DEVICE = $(filter $(CURRENT_DEVICE), $(LIST))
   ifeq ($(FOUND_DEVICE),$(CURRENT_DEVICE))
      IS_OFFICIAL=true
      LEAN_BUILD_TYPE := OFFICIAL
   else
      LEAN_BUILD_TYPE := UNOFFICIAL
   endif
endif

# Set all versions
LEAN_VERSION := LeanOS-$(LEAN_BUILD)-$(PRODUCT_VERSION_MAINTENANCE)-$(LEAN_BUILD_TYPE)-$(LEAN_POSTFIX)
LEAN_MOD_VERSION := LeanOS-$(LEAN_BUILD)-$(PRODUCT_VERSION_MAINTENANCE)-$(LEAN_BUILD_TYPE)-$(LEAN_POSTFIX)
LEAN_XTRA_VERSION := $(PRODUCT_VERSION_MAINTENANCE)-$(LEAN_BUILD_TYPE)
LEAN_DISPLAY_VERSION := $(LEAN_XTRA_VERSION)

PRODUCT_PROPERTY_OVERRIDES += \
    BUILD_DISPLAY_ID=$(BUILD_ID) \
    lean.ota.version=$(PRODUCT_VERSION_MAJOR)-$(PRODUCT_VERSION_MAINTENANCE) \
    ro.lean.version=$(LEAN_XTRA_VERSION) \
    ro.modversion=$(LEAN_MOD_VERSION) \
    ro.lean.buildtype=$(LEAN_BUILD_TYPE) \
    ro.lean.display.version=$(LEAN_DISPLAY_VERSION) \
    com.lean.fingerprint=$(LEAN_XTRA_VERSION)

