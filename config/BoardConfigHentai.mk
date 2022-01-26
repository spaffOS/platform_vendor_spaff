# Kernel
ifeq ($(LOCAL_KERNEL),)
include vendor/spaff/config/BoardConfigKernel.mk
endif

# Qcom-specific bits
ifeq ($(BOARD_USES_QCOM_HARDWARE),true)
include vendor/spaff/config/BoardConfigQcom.mk
endif

# Soong
include vendor/spaff/config/BoardConfigSoong.mk
