-- Copyright (C) 2016 OpenWrt-dist
-- Copyright (C) 2016 Jian Chang <aa65535@live.com>
-- Copyright (C) 2017 Ian Li <OpenSource@ianli.xyz>
-- Licensed to the public under the GNU General Public License v3.

local m, s, o

if luci.sys.call("pidof chinadns >/dev/null") == 0 then
	m = Map("chinadns", translate("ChinaDNS"), "%s - %s" %{translate("ChinaDNS"), translate("RUNNING")})
else
	m = Map("chinadns", translate("ChinaDNS"), "%s - %s" %{translate("ChinaDNS"), translate("NOT RUNNING")})
end

s = m:section(TypedSection, "chinadns", translate("General Setting"))
s.anonymous   = true

o = s:option(Flag, "enable", translate("Enable"))
o.rmempty     = false

o = s:option(Value, "port", translate("Local Port"))
o.placeholder = 5353
o.default     = 5353
o.datatype    = "port"
o.rmempty     = false

o = s:option(Value, "chnroute", translate("CHNRoute File"))
o.placeholder = "/etc/chinadns_chnroute.txt"
o.default     = "/etc/chinadns_chnroute.txt"
o.datatype    = "file"
o.rmempty     = false

o = s:option(Value, "foreign_subnet",
	translate("Foreign Subnet"),
	translate("Just foreign subnet. The subnet of interface WAN will be used as local subnet."))
o.placeholder = "45.76.96.0"
o.default     = "45.76.96.0"
o.datatype    = "ipaddr"
o.rmempty     = false

o = s:option(Value, "server",
	translate("Upstream Server"),
	translate("A DNS server with edns-client-subnet support required."))
o.placeholder = "8.8.8.8"
o.default     = "8.8.8.8"
o.datatype    = "ipaddr"
o.rmempty     = false

return m