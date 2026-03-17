#!/bin/bash
# WiFi ON
sed -i 's/set wireless.radio${devidx}.disabled=1/set wireless.radio${devidx}.disabled=0/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh

# Paksa hapus aplikasi yang menyebabkan segfault (jika terbawa feed)
rm -rf package/feeds/small/luci-app-fchomo
rm -rf package/feeds/small/luci-app-homeproxy

# Tambahkan config EQOS
echo "CONFIG_PACKAGE_luci-app-eqos=m" >> .config
