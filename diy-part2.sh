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
sed -i 's|^PKG_SOURCE_URL:=https://github.com/SoftEtherVPN/SoftEtherVPN_Stable/releases/download/v$(PKG_REALVERSION)-$(PKG_VERREL)|PKG_SOURCE_URL:=https://github.com/Jio0oiJ/softethervpn/releases/download/v$(PKG_VERSION)-$(PKG_VERREL)|' Makefile
sed -i 's|^PKG_HASH:=e68128b46171bd9f3f9ca38d10e60e8590a833bfc6488fa014674f9a22541f35|PKG_HASH:=3b3e047f81726b6fe6a3db1e847b6bb22ef8b1b34e4ed34b9c4769b3969f3457|' Makefile
