#!/bin/bash

set -ouex pipefail

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1

# this installs a package from fedora repos
dnf5 install -y tmux 
dnf5 install -y emacs
dnf5 install -y @base-x gcc libXft-devel libX11-devel libXinerama-devel arandr xorg-x11-xinit-session arandr

# Use a COPR Example:
#
 dnf5 -y copr enable ryanabx/cosmic-epoch
 dnf5 -y install @cosmic-desktop-environment
# Disable COPRs so they don't end up enabled on the final image:
 dnf5 -y copr disable ryanabx/cosmic-epoch

#### Example for enabling a System Unit File

systemctl enable podman.socket