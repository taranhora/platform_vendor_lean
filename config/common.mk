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
