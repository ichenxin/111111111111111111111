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

# Passwall
rm -rf feeds/packages/net/{xray-core,v2ray-geodata,sing-box,chinadns-ng,dns2socks,hysteria,ipt2socks,microsocks,naiveproxy,shadowsocks-libev,shadowsocks-rust,shadowsocksr-libev,simple-obfs,tcping,trojan-plus,tuic-client,v2ray-plugin,xray-plugin,geoview,shadow-tls}
rm -rf feeds/luci/applications/{luci-app-passwall,luci-app-passwall2}
git clone https://github.com/xiaorouji/openwrt-passwall-packages -b main package/passwall_packages
git clone https://github.com/xiaorouji/openwrt-passwall -b main package/passwall_luci

# 自定义直连规则
cp -rf ${GITHUB_WORKSPACE}/passwall_conf/direct_host package/passwall_luci/luci-app-passwall/root/usr/share/passwall/rules/direct_host
cp -rf ${GITHUB_WORKSPACE}/passwall_conf/direct_ip package/passwall_luci/luci-app-passwall/root/usr/share/passwall/rules/direct_ip

# 升级部分软件包版本，以确保正常编译
rm -rf feeds/packages/utils/unzip
git clone https://github.com/sbwml/feeds_packages_utils_unzip feeds/packages/utils/unzip

rm -rf feeds/packages/lang/golang
git clone --depth=1 https://github.com/sbwml/packages_lang_golang -b 25.x feeds/packages/lang/golang

rm -rf feeds/packages/net/curl
git clone https://github.com/sbwml/feeds_packages_net_curl feeds/packages/net/curl
