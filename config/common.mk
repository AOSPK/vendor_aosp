# Allow vendor/extra to override any property by setting it first
$(call inherit-product-if-exists, vendor/extra/product.mk)

PRODUCT_BRAND ?= KrakenProject

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

ifeq ($(PRODUCT_GMS_CLIENTID_BASE),)
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.com.google.clientidbase=android-google
else
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.com.google.clientidbase=$(PRODUCT_GMS_CLIENTID_BASE)
endif

# Default notification/alarm sounds
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.config.notification_sound=Argon.ogg \
    ro.config.alarm_alert=Hassium.ogg

ifneq ($(TARGET_BUILD_VARIANT),user)
# Thank you, please drive thru!
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += persist.sys.dun.override=0
endif

ifeq ($(TARGET_BUILD_VARIANT),eng)
# Disable ADB authentication
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += ro.adb.secure=0
else
# Enable ADB authentication
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += ro.adb.secure=1
endif

# Backup Tool
PRODUCT_COPY_FILES += \
    vendor/aosp/prebuilt/common/bin/backuptool.sh:install/bin/backuptool.sh \
    vendor/aosp/prebuilt/common/bin/backuptool.functions:install/bin/backuptool.functions \
    vendor/aosp/prebuilt/common/bin/50-lineage.sh:$(TARGET_COPY_OUT_SYSTEM)/addon.d/50-lineage.sh \
    vendor/aosp/prebuilt/common/bin/blacklist:$(TARGET_COPY_OUT_SYSTEM)/addon.d/blacklist

ifeq ($(AB_OTA_UPDATER),true)
PRODUCT_COPY_FILES += \
    vendor/aosp/prebuilt/common/bin/backuptool_ab.sh:$(TARGET_COPY_OUT_SYSTEM)/bin/backuptool_ab.sh \
    vendor/aosp/prebuilt/common/bin/backuptool_ab.functions:$(TARGET_COPY_OUT_SYSTEM)/bin/backuptool_ab.functions \
    vendor/aosp/prebuilt/common/bin/backuptool_postinstall.sh:$(TARGET_COPY_OUT_SYSTEM)/bin/backuptool_postinstall.sh
endif

# Backup Services whitelist
PRODUCT_COPY_FILES += \
    vendor/aosp/config/permissions/backup.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/sysconfig/backup.xml

# Lineage-specific broadcast actions whitelist
PRODUCT_COPY_FILES += \
    vendor/aosp/config/permissions/lineage-sysconfig.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/sysconfig/lineage-sysconfig.xml

# init.d support
PRODUCT_COPY_FILES += \
    vendor/aosp/prebuilt/common/etc/init.d/00banner:$(TARGET_COPY_OUT_SYSTEM)/etc/init.d/00banner \
    vendor/aosp/prebuilt/common/bin/sysinit:$(TARGET_COPY_OUT_SYSTEM)/bin/sysinit

ifneq ($(TARGET_BUILD_VARIANT),user)
# userinit support
PRODUCT_COPY_FILES += \
    vendor/aosp/prebuilt/common/etc/init.d/90userinit:$(TARGET_COPY_OUT_SYSTEM)/etc/init.d/90userinit
endif

# Copy all Lineage-specific init rc files
$(foreach f,$(wildcard vendor/aosp/prebuilt/common/etc/init/*.rc),\
	$(eval PRODUCT_COPY_FILES += $(f):$(TARGET_COPY_OUT_SYSTEM)/etc/init/$(notdir $f)))

# Copy over added mimetype supported in libcore.net.MimeUtils
PRODUCT_COPY_FILES += \
    vendor/aosp/prebuilt/common/lib/content-types.properties:$(TARGET_COPY_OUT_SYSTEM)/lib/content-types.properties

# Enable SIP+VoIP on all targets
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.software.sip.voip.xml

# Enable wireless Xbox 360 controller support
PRODUCT_COPY_FILES += \
    frameworks/base/data/keyboards/Vendor_045e_Product_028e.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/Vendor_045e_Product_0719.kl

# This is Lineage!
PRODUCT_COPY_FILES += \
    vendor/aosp/config/permissions/org.lineageos.android.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/org.lineageos.android.xml \
    vendor/aosp/config/permissions/privapp-permissions-lineage-system.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/privapp-permissions-lineage.xml \
    vendor/aosp/config/permissions/privapp-permissions-lineage-product.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-lineage.xml \
    vendor/aosp/config/permissions/privapp-permissions-cm-legacy.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/privapp-permissions-cm-legacy.xml

# Enforce privapp-permissions whitelist
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.control_privapp_permissions=enforce

# Hidden API whitelist
PRODUCT_COPY_FILES += \
    vendor/aosp/config/permissions/lineage-hiddenapi-package-whitelist.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/lineage-hiddenapi-package-whitelist.xml

# Power whitelist
PRODUCT_COPY_FILES += \
    vendor/aosp/config/permissions/lineage-power-whitelist.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/sysconfig/lineage-power-whitelist.xml

# Include AOSP audio files
include vendor/aosp/config/aosp_audio.mk

# Include Lineage audio files
include vendor/aosp/config/lineage_audio.mk

ifneq ($(TARGET_DISABLE_LINEAGE_SDK), true)
# Lineage SDK
include vendor/aosp/config/lineage_sdk_common.mk
endif

# TWRP
ifeq ($(WITH_TWRP),true)
include vendor/aosp/config/twrp.mk
endif

# Do not include art debug targets
PRODUCT_ART_TARGET_INCLUDE_DEBUG_BUILD := false

# Strip the local variable table and the local variable type table to reduce
# the size of the system image. This has no bearing on stack traces, but will
# leave less information available via JDWP.
PRODUCT_MINIMIZE_JAVA_DEBUG_INFO := true

PRODUCT_PACKAGES += \
    Launcher3

# AOSP packages
PRODUCT_PACKAGES += \
    ExactCalculator \
    Exchange2 \
    Terminal

# Lineage packages
PRODUCT_PACKAGES += \
    AudioFX \
    Backgrounds \
    LineageParts \
    LineageSettingsProvider \
    LineageSetupWizard \
    Eleven \
    Jelly \
    LockClock \
    Profiles \
    TrebuchetQuickStep \
    WallpaperPicker \
    WeatherProvider

# Berry styles
PRODUCT_PACKAGES += \
    LineageBlackTheme \
    LineageDarkTheme \
    LineageBlackAccent \
    LineageBrownAccent \
    LineageCyanAccent \
    LineageGreenAccent \
    LineageOrangeAccent \
    LineagePinkAccent \
    LineagePurpleAccent \
    LineageRedAccent \
    LineageTealAccent \
    LineageYellowAccent

# Disable vendor restrictions
PRODUCT_RESTRICT_VENDOR_FILES := false

# Extra tools
PRODUCT_PACKAGES += \
    7z \
    awk \
    bash \
    bzip2 \
    curl \
    getcap \
    htop \
    lib7z \
    libsepol \
    pigz \
    powertop \
    setcap \
    unrar \
    unzip \
    vim \
    wget \
    zip

# Charger
PRODUCT_PACKAGES += \
    charger_res_images

# Custom off-mode charger
ifeq ($(WITH_LINEAGE_CHARGER),true)
PRODUCT_PACKAGES += \
    lineage_charger_res_images \
    font_log.png \
    libhealthd.lineage
endif

# Filesystems tools
PRODUCT_PACKAGES += \
    fsck.exfat \
    fsck.ntfs \
    mke2fs \
    mkfs.exfat \
    mkfs.ntfs \
    mount.ntfs

# Openssh
PRODUCT_PACKAGES += \
    scp \
    sftp \
    ssh \
    sshd \
    sshd_config \
    ssh-keygen \
    start-ssh

# rsync
PRODUCT_PACKAGES += \
    rsync

# Storage manager
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.storage_manager.enabled=true

# Media
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    media.recorder.show_manufacturer_and_model=true

# These packages are excluded from user builds
PRODUCT_PACKAGES_DEBUG += \
    micro_bench \
    procmem \
    procrank \
    strace

# Conditionally build in su
ifneq ($(TARGET_BUILD_VARIANT),user)
ifeq ($(WITH_SU),true)
PRODUCT_PACKAGES += \
    su
endif
endif

PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS += vendor/aosp/overlay
DEVICE_PACKAGE_OVERLAYS += vendor/aosp/overlay/common

PRODUCT_EXTRA_RECOVERY_KEYS += \
    vendor/aosp/build/target/product/security/lineage

-include vendor/lineage-priv/keys/keys.mk
-include $(WORKSPACE)/build_env/image-auto-bits.mk
-include vendor/aosp/config/partner_gms.mk
-include vendor/aosp/config/version.mk

# OpenGApps
include vendor/aosp/config/gapps.mk

# Bootanimation
PRODUCT_COPY_FILES += \
    vendor/aosp/media/bootanimation.zip:system/media/bootanimation.zip
