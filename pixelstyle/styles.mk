# Pixel Style
PRODUCT_COPY_FILES += \
    vendor/aosp/pixelstyle/product/etc/default-permissions/default-permissions.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/default-permissions/pixelstyle-default-permissions.xml \
    vendor/aosp/pixelstyle/product/etc/permissions/privapp-permissions-google-p.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/pixelstyle-privapp-permissions-google-p.xml \
    vendor/aosp/pixelstyle/product/etc/sysconfig/pixel.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/sysconfig/pixelstyle-pixel.xml \
    vendor/aosp/pixelstyle/product/etc/sysconfig/pixel_experience_2017.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/sysconfig/pixelstyle-pixel_experience_2017.xml \
    vendor/aosp/pixelstyle/product/etc/sysconfig/pixel_experience_2018.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/sysconfig/pixelstyle-pixel_experience_2018.xml \
    vendor/aosp/pixelstyle/product/etc/sysconfig/pixel_experience_2019.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/sysconfig/pixelstyle-pixel_experience_2019.xml \
    vendor/aosp/pixelstyle/product/etc/sysconfig/pixel_experience_2019_midyear.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/sysconfig/pixelstyle-pixel_experience_2019_midyear.xml \
    vendor/aosp/pixelstyle/product/etc/sysconfig/pixel_experience_2020.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/sysconfig/pixelstyle-pixel_experience_2020.xml \
    vendor/aosp/pixelstyle/product/etc/sysconfig/pixel_experience_2020_midyear.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/sysconfig/pixelstyle-pixel_experience_2020_midyear.xml \
    vendor/aosp/pixelstyle/product/lib64/libsketchology_native.so:$(TARGET_COPY_OUT_PRODUCT)/lib64/libsketchology_native.so \
    vendor/aosp/pixelstyle/product/etc/res/images/charger/battery_fail.png:$(TARGET_COPY_OUT_PRODUCT)/etc/res/images/charger/battery_fail.png \
    vendor/aosp/pixelstyle/product/etc/res/images/charger/battery_scale.png:$(TARGET_COPY_OUT_PRODUCT)/etc/res/images/charger/battery_scale.png \
    vendor/aosp/pixelstyle/product/etc/res/images/charger/main_font.png:$(TARGET_COPY_OUT_PRODUCT)/etc/res/images/charger/main_font.png \
    vendor/aosp/pixelstyle/product/etc/res/values/charger/animation.txt:$(TARGET_COPY_OUT_PRODUCT)/etc/res/values/charger/animation.txt
    
PRODUCT_PACKAGES += \
    PixelStyleFrameworksOverlay \
    PixelStyleSystemUIOverlay
