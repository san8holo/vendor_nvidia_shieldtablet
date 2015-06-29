# DO NOT add conditionals to this makefile of the form
#
#    ifeq ($(TARGET_TEGRA_VERSION),<latest SOC>)
#        <stuff for latest SOC>
#    endif
#
# Such conditionals break forward compatibility with future SOCs.
# If you must add conditionals to this makefile, use the form
#
#    ifneq ($(filter <list of older SOCs>,$(TARGET_TEGRA_VERSION)),)
#       <stuff for old SOCs>
#    else
#       <stuff for new SOCs>
#    endif

nv_modules := \
    com.nvidia.nvstereoutils \
    DidimCalibration \
    fuse_bypass.txt \
    gps.$(TARGET_BOARD_PLATFORM) \
    gps.mtk \
    hdcp_test \
    hdcp1x.srm \
    hdcp2x.srm \
    hdcp2xtest.srm \
    hosts \
    init.hdcp \
    init.tlk \
    inv_self_test \
    libhybrid \
    libinvensense_hal \
    libmd5 \
    libmllite \
    libmnlp_mt3332 \
    libmplmpu \
    libnvapputil \
    libnvboothost \
    libnvcpl \
    libnvdioconverter \
    libnvfxmath \
    libnvhdmi3dplay_jni \
    libnvimageio \
    libnvintr \
    libnvos \
    libnvos_aos \
    libnvos_aos_libgcc_avp \
    libnvrm \
    libnvrm_channel_impl \
    libnvrm_graphics \
    libnvrm_impl \
    libnvrm_limits \
    libnvrm_secure \
    libnvsystemuiext_jni \
    librs_jni \
    libsensors.base \
    libsensors.mpl \
    mnld \
    mnl.prop \
    MockNVCP \
    nfc.$(TARGET_BOARD_PLATFORM) \
    NvCPLSvc \
    com.nvidia.NvCPLSvc.api \
    NvCPLUpdater \
    nv_hciattach \
    pbc \
    pbc2 \
    lbh_images \
    QuadDSecurityService \
    sensors.tegra \
    tegrastats \
    ussrd \
    cvc \
    trace-cmd \
    powercap \
    PowerShark \
    libnvopt-artc \
    NvBenchmarkBlocker
#    TegraOTA \
# disabled mjolnir components
#    libgrid \
#    libgrid_jrtp \
#    nvpgcservice \
#    libremoteinput \
#    libnvthreads \
#    libnvrtpaudio \
#    libadaptordecoder \
#    libadaptordecoderjni \
# nvcpud
#    libnvcpud \
#    nvcpud \

ifeq ($(TARGET_USE_NCT),true)
nv_modules += \
    libnvnct
endif

ifeq ($(SECURE_OS_BUILD),tlk)
nv_modules += \
    tos \
    tlk \
    tlk_daemon \
    keystore.tegra
endif

ifeq ($(NV_MOBILE_DGPU),1)
nv_modules += \
    libGLESv1_CM_dgpu_impl \
    libGLESv2_dgpu_impl \
    libglcore \
    mknod \
    nvidia.ko
endif

ifeq ($(TARGET_QUICKBOOT), true)
nv_modules += \
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
nv_modules += \
    vcm30t124_cpu_stage1.a \
    vcm30t124_cpu_stage2.a \
    vcm30t124_cop_stage1.a \
    vcm30t124_cop_stage2.a
endif
endif

ifeq ($(TARGET_QB_FLASH_TOOL), true)
nv_modules += \
    nvimagegen \
    nvskuflash \
    nvskupreserve
endif

include $(CLEAR_VARS)

LOCAL_MODULE := nvidia_tegra_proprietary_src_modules
LOCAL_MODULE_TAGS := optional
LOCAL_REQUIRED_MODULES := $(nv_modules)
LOCAL_REQUIRED_MODULES += $(ALL_NVIDIA_TESTS)
include $(BUILD_PHONY_PACKAGE)

include $(CLEAR_VARS)
LOCAL_MODULE := nvidia-google-tests

# This test doesn't compile under 64-bit targets (yet)
ifneq ($(TARGET_IS_64_BIT),true)
LOCAL_REQUIRED_MODULES := camera2_test
endif
include $(BUILD_PHONY_PACKAGE)
