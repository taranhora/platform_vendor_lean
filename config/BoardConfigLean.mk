ifeq ($(BOARD_USES_QCOM_HARDWARE),true)
include vendor/lean/config/BoardConfigQcom.mk
endif

include vendor/lean/config/BoardConfigKernel.mk
