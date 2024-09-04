# pimox7-lxc-images
Pimox7 out-of-the-box pulls incompatible (AMD64) CT templates. This app indexes and pulls ARM64 from linuxcontainers.org and custom.

## One-Step Automated Download

```
wget https://raw.githubusercontent.com/davift/pimox7-lxc-images/main/install.sh -O install.sh && chmod +x install.sh && sudo ./install.sh 
```

## What are the Custom Images for?

- Kali CLI
  - All the look and feel of the Kali command prompt plus all the basic tools.

![Kali CLI](https://github.com/davift/pimox7-lxc-images/blob/main/kali-cli.png)

- Kali Desktop with XRDP
  - After creating and stating a CT with this image, use any RDP client to connect to a fully-fledged Virtual Desktop experience.

![Kali Desktop XRDP](https://github.com/davift/pimox7-lxc-images/blob/main/kali-desktop-xrdp.png)

- Tor Gateway
  - This appliance works as a gateway to route (tunnel) all traffic through the Tor Network.
    - The first network adapter eth0 on vmbr0 (Internet) with DHCP
    - Create a secondary adapter eth1 on the vmbr2 (isolated network) with  the IP 10.10.10.1.
    - All inbound traffic on eth1 will be served via Tor.
  - Any other CT that is connected to vmbr2 needs the following network configuration.
    - IPv4 10.10.10.2/24 to 10.10.10.254/24
    - Gateway 10.10.10.1.

![Tor Gateway Server](https://github.com/davift/pimox7-lxc-images/blob/main/tor-gateway-1.png)

![Tor Gateway Clientn](https://github.com/davift/pimox7-lxc-images/blob/main/tor-gateway-2.png)

## Alternative Manual Download

Disable (hide) existent ADM64 sources:

```
cd /var/lib/pve-manager/apl-info
sudo mv releases.turnkeylinux.org /root
sudo mv download.proxmox.com /root
sudo wget https://github.com/davift/pimox7-lxc-images/raw/main/aplinfo.dat -O download.proxmox.com
sudo chmod 444 download.proxmox.com
```

Download the "Last Stable Build" templates from linuxcontainers.org

```
cd /var/lib/vz/template/cache/
# Alpine
wget -q 'https://jenkins.linuxcontainers.org/job/image-alpine/lastStableBuild/architecture=arm64,release=3.20,variant=default/artifact/rootfs.tar.xz' -O 'alpine-3.20-arm64.tar.xz'
wget -q 'https://jenkins.linuxcontainers.org/job/image-alpine/lastStableBuild/architecture=arm64,release=edge,variant=default/artifact/rootfs.tar.xz' -O 'alpine-edge-arm64.tar.xz'
# Debian
wget -q 'https://jenkins.linuxcontainers.org/job/image-debian/architecture=arm64,release=bookworm,variant=default/lastSuccessfulBuild/artifact/rootfs.tar.xz' -O 'debian-12-bookworm-arm64.tar.xz'
wget -q 'https://jenkins.linuxcontainers.org/job/image-debian/architecture=arm64,release=trixie,variant=default/lastSuccessfulBuild/artifact/rootfs.tar.xz' -O 'debian-testing-trixie-arm64.tar.xz'
# Ubuntu
wget -q 'https://jenkins.linuxcontainers.org/job/image-ubuntu/architecture=arm64,release=jammy,variant=default/lastSuccessfulBuild/artifact/rootfs.tar.xz' -O 'ubuntu-22.04-jammy-arm64.tar.xz'
wget -q 'https://jenkins.linuxcontainers.org/job/image-ubuntu/architecture=arm64,release=mantic,variant=default/lastSuccessfulBuild/artifact/rootfs.tar.xz' -O 'ubuntu-23.10-mantic-arm64.tar.xz'
# Kali
wget -q 'https://jenkins.linuxcontainers.org/job/image-kali/lastStableBuild/architecture=arm64,release=current,variant=default/artifact/rootfs.tar.xz' -O 'kali-2024-rolling-arm64.tar.xz'
# Fedora
wget -q 'https://jenkins.linuxcontainers.org/view/Images/job/image-fedora/lastStableBuild/architecture=arm64,release=40,variant=default/artifact/rootfs.tar.xz' -O 'fedora-40-arm64.tar.xz'
# Alma
wget -q 'https://jenkins.linuxcontainers.org/view/Images/job/image-almalinux/lastStableBuild/architecture=arm64,release=9,variant=default/artifact/rootfs.tar.xz' -O 'alma-9-arm64.tar.xz'
# Arch
wget -q 'https://jenkins.linuxcontainers.org/view/Images/job/image-archlinux/architecture=arm64,release=current,variant=default/3104/artifact/rootfs.tar.xz' -O 'arch-rolling-arm64.tar.xz'
# Rocky
wget -q 'https://jenkins.linuxcontainers.org/view/Images/job/image-rockylinux/lastStableBuild/architecture=arm64,release=9,variant=default/artifact/rootfs.tar.xz' -O 'rocky-9-arm64.tar.xz'
```

Download the custom image templates

```
cd /var/lib/vz/template/cache/
# Kali Cli - Custom build (not official)
wget -q 'https://s3.dftorres.ca/dft/lxc-images/kali-cli.tar.gz' -O 'kali-cli.tar.gz'
# Kali Desktop with XRDP - Custom build (not official)
wget -q 'https://s3.dftorres.ca/dft/lxc-images/kali-desk-xrdp.tar.gz' -O 'kali-desk-xrdp.tar.gz'
# Tor Gateway - A gateway that tunnels all system traffic through Tor.
wget -q 'https://s3.dftorres.ca/dft/lxc-images/tor-gateway.tar.gz' -O 'tor-gateway.tar.gz'
```

## More Information

- TorGateway / TorTunnel
  - https://dft.wiki/?p=4377
  - https://github.com/davift/TorTunnel
- Kali Cli / Desktop
  - https://dft.wiki/?p=3430
