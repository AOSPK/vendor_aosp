# Set specific identifier for Android Go enabled products
PRODUCT_TYPE := go

# Inherit full common stuff
$(call inherit-product, vendor/aosp/config/common_full_phone.mk)
