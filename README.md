# Home UDMP utils

This is a collection of tools im using on my UDMP, in conjunction with my k8s homelab [https://github.com/Truxnell/home-cluster](https://github.com/Truxnell/home-cluster)

This is also in conjuction with [https://github.com/boostchicken-dev/udm-utilities](https://github.com/boostchicken-dev/udm-utilities) scripts.

# Installation

1. Install boostchicken on-boot-scrpt.  The UDMP wipes a lot of its filesystem on reboot (is it is ephermal folders) so this allows for scripts to run each boot.  This can ensure we setup/startup utils each reboot/firmware upgrade.

2. Copy desired scripts into `/mnt/data/on-boot.d/` and `chmod +x <file>`.  Any executable script in this folder will run on each boot.

# Utilities

IPXE boot script. [ipxe-boot]()./ipxe-boot).  

I wrote this to allow me to parse to computers PXE booting based on their type.  UDM only allows one boot image filename to be passed, which doesnt work when you are trying to netboot both ARM64 and AMD64 devices.
This was required to run (sidero)[https://sidero.dev] in my homelab.

