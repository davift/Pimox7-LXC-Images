#!/bin/bash
echo ''
echo ''
echo ''

cd /var/lib/pve-manager/apl-info
sudo mv releases.turnkeylinux.org /root 
sudo mv download.proxmox.com /root

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

echo ''
echo 'Completed'
echo ''
exit 0
