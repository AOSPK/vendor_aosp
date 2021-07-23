# Inherit common stuff
$(call inherit-product, vendor/aosp/config/common.mk)

# Inherit car device tree
$(call inherit-product, device/custom/car/custom_car.mk)

# Inherit the main AOSP car makefile that turns this into an Automotive build
$(call inherit-product, packages/services/Car/car_product/build/car.mk)
