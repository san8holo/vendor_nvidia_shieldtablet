$(call inherit-product, $(LOCAL_PATH)/base.mk)
$(call inherit-product, $(LOCAL_PATH)/python/full.mk)
$(call inherit-product, $(LOCAL_PATH)/tests.mk)
$(call inherit-product, $(LOCAL_PATH)/utils.mk)

# Most of these should have dependencies from elsewhere, and don't need to be here
PRODUCT_PACKAGES += \
    libnvidia_APP5Marker_jni:32 \
    libnvcamerahdr_v3:32 \
    libnvobjecttracking:32 \
    libnvcameratools:32 \
    libnvdigitalzoom:32 \
    libnvmm_camera:32 \
    libnvstitching:32

ifeq ($(TARGET_BUILD_VARIANT), eng)
PRODUCT_PACKAGES += \
    ItsService
endif
