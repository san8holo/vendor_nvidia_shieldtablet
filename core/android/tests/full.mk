PRODUCT_PACKAGES += \
    btmacwriter \
    dfs_cfg \
    dfs_log \
    dfs_monitor \
    dfs_stress \
    nvtest \
    powersig \
    tegrastats

# Most of these should have dependencies from elsewhere, and don't need to be here
PRODUCT_PACKAGES += \
    libnvtestio \
    libnvtestmain \
    libnvtestresults \
    libnvtestrun
