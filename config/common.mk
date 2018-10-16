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

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    vendor/lean/overlay/common \
    vendor/lean/overlay/themes

# Bootanimation
$(call inherit-product, vendor/lean/config/bootanimation.mk)

# Apns
 PRODUCT_COPY_FILES += \
     vendor/lean/prebuilt/common/etc/apns-conf.xml:system/etc/apns-conf.xml

# Versioning
include vendor/lean/config/version.mk

# Omni Poor Man Themes
PRODUCT_PACKAGES += \
    DocumentsUITheme \
    DialerTheme \
    TelecommTheme


 PRODUCT_PACKAGES += \
    NotificationsXtended \
    NotificationsBlack \
    NotificationsDark \
    NotificationsLight \
    NotificationsPrimary

 PRODUCT_PACKAGES += \
    AccentSluttyPink \
    AccentPixel \
    AccentGoldenShower \
    AccentDeepOrange \
    AccentMisticBrown \
    AccentOmni \
    AccentWhite \
    AccentTeal \
    AccentFromHell \
    AccentBlueMonday \
    AccentSmokingGreen \
    AccentDeadRed \
    AccentRottenOrange \
    AccentDeepPurple

 PRODUCT_PACKAGES += \
    PrimaryAlmostBlack \
    PrimaryBlack \
    PrimaryXtended \
    PrimaryXtendedClear \
    PrimaryEyeSoother \
    PrimaryOmni \
    PrimaryWhite \
    PrimaryColdWhite \
    PrimaryWarmWhite \
    PrimaryDarkBlue

