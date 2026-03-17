#!/bin/bash

# 1. Atur IP Default ke 192.168.1.1 (Ubah jika perlu)
sed -i 's/192.168.1.1/192.168.1.1/g' package/base-files/files/bin/config_generate

# 2. AKTIFKAN WIFI ON DEFAULT (Crucial!)
# Menghapus 'disabled 1' agar WiFi langsung memancar setelah flash
sed -i 's/set wireless.radio${devidx}.disabled=1/set wireless.radio${devidx}.disabled=0/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh

# 3. Optimasi RAM 64MB (ZRAM & Logging)
# Mengecilkan ukuran log di RAM agar tidak penuh
sed -i 's/log_size/log_size 512/g' package/base-files/files/bin/config_generate

# 4. Memastikan dependencies EQOS ikut terpilih
echo "CONFIG_PACKAGE_luci-app-eqos=m" >> .config
echo "CONFIG_PACKAGE_kmod-sched-core=y" >> .config
echo "CONFIG_PACKAGE_tc-tiny=y" >> .config
