$(call inherit-product, $(LOCAL_PATH)/base.mk)
$(call inherit-product, $(LOCAL_PATH)/firmware.mk)
$(call inherit-product, $(LOCAL_PATH)/nvsi.mk)
ifndef PLATFORM_IS_NEXT
$(call inherit-product, $(LOCAL_PATH)/wfd.mk)
endif
$(call inherit-product, $(LOCAL_PATH)/widevine.mk)
$(call inherit-product, $(LOCAL_PATH)/tests.mk)
