# Generic product
PRODUCT_NAME := lean
PRODUCT_BRAND := lean
PRODUCT_DEVICE := generic

 EXCLUDE_SYSTEMUI_TESTS := true

 # version
include vendor/lean/config/version.mk

 # Props
include vendor/lean/config/lean_props.mk

 # Packages
include vendor/lean/config/packages.mk

# Backup Tool
PRODUCT_COPY_FILES += \
    vendor/lean/prebuilt/common/bin/backuptool.sh:install/bin/backuptool.sh \
    vendor/lean/prebuilt/common/bin/backuptool.functions:install/bin/backuptool.functions \
    vendor/lean/prebuilt/common/bin/50-lean.sh:system/addon.d/50-lean.sh \
    vendor/lean/prebuilt/common/bin/blacklist:system/addon.d/blacklist

ifeq ($(AB_OTA_UPDATER),true)
PRODUCT_COPY_FILES += \
    vendor/lean/prebuilt/common/bin/backuptool_ab.sh:system/bin/backuptool_ab.sh \
    vendor/lean/prebuilt/common/bin/backuptool_ab.functions:system/bin/backuptool_ab.functions \
    vendor/lean/prebuilt/common/bin/backuptool_postinstall.sh:system/bin/backuptool_postinstall.sh
endif

