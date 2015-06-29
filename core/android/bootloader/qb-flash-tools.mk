ifeq ($(TARGET_QB_FLASH_TOOL), true)
PRODUCT_PACKAGES += \
    nvimagegen \
    nvskuflash \
    nvskupreserve
endif
