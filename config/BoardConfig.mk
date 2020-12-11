# Safetynet
TARGET_FORCE_BUILD_FINGERPRINT := google/redfin/redfin:11/RQ1A.201205.010/6953398:user/release-keys

include vendor/aosp/config/BoardConfigKernel.mk

ifeq ($(BOARD_USES_QCOM_HARDWARE),true)
include vendor/aosp/config/BoardConfigQcom.mk
endif

include vendor/aosp/config/BoardConfigSoong.mk
