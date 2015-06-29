ifeq ($(TARGET_QUICKBOOT), true)
PRODUCT_PACKAGES += \
    quickboot \
    quickboot1.bin \
    rcmboot.bin \
    cpu_stage2.bin \
    nvml \
    compress_lzf \
    compress_zlib
endif

ifeq ($(TARGET_QUICKBOOT), true)
ifeq ($(QB_PRIVATE), 1)
PRODUCT_PACKAGES += \
    vcm30t124_cpu_stage1.a \
    vcm30t124_cpu_stage2.a \
    vcm30t124_cop_stage1.a \
    vcm30t124_cop_stage2.a
endif
endif
