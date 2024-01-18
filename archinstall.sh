## ArchLinux Install script

#!bin/bash 

# network
ip link

rfkill unblock all

iwctl station wlan0 scan

iwctl station wlan0 get networks

echo "Enter wifi name: $wifi"

read $wifi

iwctl station wlan0 connect "$wifi"

ping archlinux.org

# clock
timedatectl

# partition
fdisk -l

lsbkl

fdisk /dev/nvmen0

mkfs.ext4 /dev/nvme0n1p3

mkswap /dev/nvme0n1p2

mkfs.fat -F 32 /dev/nvme0n1p1

# mount partitions
mount /dev/nvme0n1p3 /mnt

mount --mkdir /dev/nvme0n1p1 /mnt/boot

swapon /dev/nvme0n1p2

# install packages
pacstrap -K /mnt base linux linux-firmware neovim man-db man-pages iwctl dhcpcd grub efibootmgr

# configure sys
genfstab -U /mnt >> /mnt/etc/fstab

# chroot
arch-chroot /mnt

# timezone
ln -sf /usr/share/zoneinfo/UTC /etc/localtime

hwclock --systohc

# locale
nvim /etc/locale.gen

echo "LANG=en_US.UTF-8" > /etc/locale.conf

# hostname
echo "archbox" > /etc/hostname
passwd

# GRUB
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB

grub-mkconfig -o /boot/grub/grub.cfg

exit

umount -R /mnt

reboot
