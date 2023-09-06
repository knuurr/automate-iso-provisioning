# Ubuntu Custom ISO Configuration with PXEless

This repository contains configuration and script templates to create customized Ubuntu ISO images using the PXEless container. The end result is a personalized ISO image with configurations defined by Subiquity, cloud-init, and a bootstrap script.

For detailed usage instructions and a comprehensive guide, please refer to the [Homelab Writeup](https://github.com/knuurr/homelab-writeup). The Homelab Writeup repository provides step-by-step instructions on how to use the files in this repository to create your customized Ubuntu ISO images.

**Note**: This repository serves exclusively as a companion to the tutorial mentioned above. For specific details and practical use cases, please consult the [Homelab Writeup](https://github.com/knuurr/homelab-writeup).

## Repository Contents

- `create-iso-template.sh`: Template script with necessary variables and commands to provisonm ISO
- `template-eth` and `template-wifi`: Templates for instalations, based on whether destination host will be connected via Wifi or Ethernet (slight differences)

## Getting Started

To get started with creating your customized Ubuntu ISO images, follow the instructions in the [Homelab Writeup](https://github.com/knuurr/homelab-writeup).

## License

This repository is provided under the [MIT License](LICENSE).
