CONNECTIVITY_FIRMWARES =+ " \
	linux-firmware-bcm43455 \
	linux-firmware-ibt-11-5 \
	linux-firmware-ibt-12-16 \
	linux-firmware-ibt-18-16-1 \
	linux-firmware-ibt-hw-37-7 \
	linux-firmware-ibt-hw-37-8 \
	linux-firmware-iwlwifi-3168 \
	linux-firmware-iwlwifi-9000 \
	linux-firmware-iwlwifi-9260 \
	linux-firmware-iwlwifi-qu-b0-hr-b0 \
	linux-firmware-rtl8723 \
	linux-firmware-rtl8821 \
	linux-firmware-rtl8723b-bt \
	linux-firmware-ralink-nic \
	"

CONNECTIVITY_FIRMWARES_append_genericx86-64 = " \
    linux-firmware-ath10k \
"

CONNECTIVITY_FIRMWARES_append_surface-go = " \
	linux-firmware-ath10k-qca6174 \
	linux-firmware-i915-kbl \
	linux-firmware-iwlwifi-cc-a0 \
"

CONNECTIVITY_FIRMWARES_append_surface-pro-6 = " \
	linux-firmware-i915-kbl \
	linux-firmware-ipts-v102 \
	linux-firmware-pcie8897 \
"

CONNECTIVITY_FIRMWARES_remove = "linux-firmware-wl12xx"

CONNECTIVITY_FIRMWARES_remove_surface-go = " \
    linux-firmware-bcm43455 \
    linux-firmware-ibt-11-5 \
    linux-firmware-ibt-12-16 \
    linux-firmware-ibt-18-16-1 \
    linux-firmware-ibt-hw-37-7 \
    linux-firmware-ibt-hw-37-8 \
    linux-firmware-iwlwifi-3168 \
    linux-firmware-iwlwifi-9000 \
    linux-firmware-iwlwifi-9260 \
    linux-firmware-iwlwifi-qu-b0-hr-b0 \
    linux-firmware-pcie8897 \
    linux-firmware-rtl8723 \
    linux-firmware-rtl8821 \
    linux-firmware-rtl8723b-bt \
    linux-firmware-ralink-nic \
    linux-firmware-ath9k \
    linux-firmware-ralink \
    linux-firmware-rtl8192cu \
    linux-firmware-rtl8192su \
    linux-firmware-bcm43143 \
    linux-firmware-iwlwifi-135-6 \
    linux-firmware-iwlwifi-3160 \
    linux-firmware-iwlwifi-6000-4 \
    linux-firmware-iwlwifi-6000g2a-6 \
    linux-firmware-iwlwifi-6000g2b-6 \
    linux-firmware-iwlwifi-6050-5 \
    linux-firmware-iwlwifi-7260 \
    linux-firmware-iwlwifi-7265 \
    linux-firmware-iwlwifi-7265d \
    linux-firmware-iwlwifi-8000c \
    linux-firmware-iwlwifi-8265 \
    linux-firmware-rtl8188eu \
    linux-firmware-wl18xx \
"

# these are now just empty packages so let's remove them to avoid a build error
CONNECTIVITY_FIRMWARES_remove = " \
    linux-firmware-iwlwifi-3160-7 \
    linux-firmware-iwlwifi-3160-8 \
    linux-firmware-iwlwifi-3160-9 \
    linux-firmware-iwlwifi-6000g2a-5 \
    linux-firmware-iwlwifi-6000g2b-5 \
    linux-firmware-iwlwifi-6050-4 \
"

CONNECTIVITY_MODULES =+ " \
	rtl8812au \
"

CONNECTIVITY_MODULES_remove_surface-go = "rtl8812au"

# we need to clean-up rootfs space so let's remove some unused firmware
CONNECTIVITY_FIRMWARES_remove = "linux-firmware-wl18xx"
CONNECTIVITY_FIRMWARES_remove = "linux-firmware-wlcommon"
