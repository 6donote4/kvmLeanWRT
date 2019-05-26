# LeanWRT Repository Backups
中文：如何编译自己需要的 OpenWrt 固件-恩山L大删除源码的备份及其他包补充

- 源码来自[coolsnowwolf](https://github.com/coolsnowwolf/lede)Package/lean仓库，源码删除前的一次状态。
- 在此基础之上加入KoolProxy,Chinadns,kcptun源码包,按照Github上检索到的一些适合国内网络环境的项目。筛选，编译，确认编译无异常后，纳入到Package中。
- 仓库中luci-app-ssr-plus原包中Makefile有错误，导致编译出现依赖错误，对比之前的Makefile文件,已修改好，可以顺利编译。
- 源码包已解锁luci-app-ssr-plus。
- amule及softetherVPN在编译过程中出，已在.config编译配置文件中取消选择。
- 本源码包选择的是x86_64架构进行编译配置，适用于虚拟机。
- 编译后的固件见 tag release,也可自行编译。
- 由于硬件路由性能差。需要考虑兼容性，及架构问题。已放弃硬件路由固件编译。

使用方法:
1.下载openwrt源码
```sh
git clone https://github.com/openwrt/openwrt.git
```
2.下载本源码包
```sh
git clone https://github.com/6donote4/kvmLeanWRT.git
```
3.拷贝本源码包及编译配置文件到openwrt目录
```sh
cp -rf ./kvmLeanWRT/package/lean ./openwrt/package/
cp -rf ./kvmLeanWRT/config ./openwrt/.config
```
4.编译,若路由器中无全局梯子，可以考虑使用proxychains
+ a 下载并安装proxychains
```sh
sudo apt-get update -y
sudo apt-get install proxychains
```
+ b 配置proxychains.conf文件,举例宿主机上有socks5代理或者http代理 
```sh
sudo echo "http 127.0.0.1 3120" >> /etc/prooxychains.conf
```
```sh
sudo echo "socks5 127.0.0.1 1080" >> /etc/proxychains.conf
```
+ c 编译及拉取源码更新
```sh
cd openwrt
proxychains ./scripts/feeds update -a
proxychains ./scripts/feeds install -a
make -j4 V=s menuconfig
proxychains make -j1 V=s
```
+ d 编译注意点:
弹出编译选择框之后，移动光标选择load,保持.config不动,选确定
目录内的编译配置文件已经编译成功过，保持该配置，如果梯子没问题
可一次成功。编译前下载dl包到openwrt目录。可以缩短编译时间。
本人在重编译的过程中，因梯子未配置ipv6,在编译python包的出现错误，
此时撤掉梯子，直接``make -j4 V=s``，就不会有问题了。
+ e 编译完成后的目标文件在
openwrt/bin/target/x86_64 目录下。
编译时，虚拟机磁盘最好分配40GB。
5.固件烧写:
+ a. 在任意一种虚拟化平台上运行任意Linux发行版(vbox,vmware,kvm等)
+ b. 固件镜像选择硬盘挂载，以便查找盘符。创建一个虚拟空白硬盘文件。
+ c. 查找盘符:
```sh
sudo fdisk -l
```
    确认出镜像盘如(/dev/sda),目标盘如(/dev/sdb),开始烧写。
```sh
sudo dd if=/dev/sda of=/dev/sdb
```
    使用gparted 调整sdb磁盘空间。
    烧写完成，挂载到虚拟机实例，进入openWRT后，在openwrt虚拟机内更改密码，
    启动web服务，设置LAN ip地址。
```sh
passwd
/etc/init.d/uhttpd enable
/etc/init.d/uhttpd start
vi /etc/config/network
/etc/init.d/network restart
```
Note: Addition Lean's private package source code in ./package/lean directory. Use it under GPL v3.

GPLv3 is compatible with more licenses than GPLv2: it allows you to make combinations with code that has specific kinds of additional requirements that are not in GPLv3 itself. Section 7 has more information about this, including the list of additional requirements that are permitted.
# kvmLeanWRT
