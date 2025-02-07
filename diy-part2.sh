#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

# Modify default IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate

# Modify default theme
#sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# Modify hostname
#sed -i 's/OpenWrt/P3TERX-Router/g' package/base-files/files/bin/config_generate

rm -rf feeds/packages/lang/golang
git clone https://github.com/sbwml/packages_lang_golang -b 23.x feeds/packages/lang/golang

rm -rf feeds/packages/net/adguardhome
git clone https://github.com/Jio0oiJ/adguardhome feeds/packages/net/adguardhome

find ./ | grep Makefile | grep v2ray-geodata | xargs rm -f
find ./ | grep Makefile | grep mosdns | xargs rm -f

git clone https://github.com/sbwml/luci-app-mosdns -b v5.3.3 package/mosdns
git clone https://github.com/sbwml/v2ray-geodata package/v2ray-geodata
curl -o package/mosdns/luci-app-mosdns/root/etc/mosdns/config_custom.yaml https://raw.githubusercontent.com/Jio0oiJ/mosdns_config/master/config_custom.yaml

rm -rf package/feeds/luci/luci-app-passwall
rm -rf package/feeds/packages/hysteria
rm -rf feeds/packages/net/v2ray-geodata
git clone https://github.com/xiaorouji/openwrt-passwall package/passwall
git clone https://github.com/xiaorouji/openwrt-passwall-packages package/passwall-packages
curl -o feeds/packages/net/softethervpn/Makefile https://raw.githubusercontent.com/Jio0oiJ/softethervpn/master/Makefile
