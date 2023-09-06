#!/bin/bash
# An example script for installing packages into a chrooted squashfs
# The article below provides more context on this process.
# How to Create Custom Debian Based ISO by Alex M. Schapelle
# Ref: https://dev.to/otomato_io/how-to-create-custom-debian-based-iso-4g37

# Add a DNS Server to /etc/rsolv.conf to initialize internet connectivity
# since it has not been initialized via a normal boot process.
# Cloudflare users should consider using 1.1.1.1 instead, especially if
# utilizing cloudflared/argo tunnel.
echo 'nameserver 8.8.8.8' > /etc/resolv.conf

# # Update the apt package cache since it's not present on the ISO by default
echo '[*] Updating package cache....'
apt-get update
echo '[*] Package cache updated'

# # List of packages to be installed during build
echo '[*] Installing packages....'

# Used as PoC in tutorial - you don't need wpasupplicant when using Ethernet

# apt-get install -y \
#     wpasupplicant \
#     cowsay
echo '[*] Packages installed'

# # Clean the apt-package cache to prevent stale package data on install
# # as well as prevent inflating the image size
echo '[*] Cleaning package cache....'
apt-get clean
echo '[*] Package cache cleaned'

# # Remove our changes to the resolv.conf file
echo ' ' > /etc/resolv.conf

# # Clear the history before exiting avoids leaking potentially sensitive data
echo '[*] cleaning DNS and history....'
echo ' ' > /etc/resolv.conf

history -c

exit

