# Vagrant on WSL2: https://blog.thenets.org/how-to-run-vagrant-on-wsl-2/


# This command runs a Docker container to customize and generate an Ubuntu ISO image for automated installation (autoinstall).
# It uses the 'cloudymax/pxeless' Docker image, which is designed to create custom ISO images.

# Define variables for customization
DATA_DIRECTORY="$(pwd)"   # The current working directory
AUTOINSTALL_FILE="./template-eth/autoinstall-eth.yaml"   # The user-data file, name, path - relative to DATA_DIRECTORY.
SOURCE_ISO="ubuntu-22.04.2-live-server-amd64.iso"   # Source ISO file
EXTRAS_FOLDER="/data/template-eth/extras"   # Path to the extras folder, as seen from inside of volume 


# Output variable values before executing the Docker command
echo "DATA_DIRECTORY: $DATA_DIRECTORY"
echo "AUTOINSTALL_FILE: $AUTOINSTALL_FILE"
echo "SOURCE_ISO: $SOURCE_ISO"
echo "EXTRAS_FOLDER: $EXTRAS_FOLDER"


# --volume "$(pwd):/data": Mounts the current working directory as '/data' inside the container.

# -a: Generates an all-in-one ISO image by embedding user-data and meta-data into the ISO.
# -u autoinstall.yaml: Specifies the path to the user-data file, which contains autoinstall configuration.
# -s ubuntu-22.04.2-live-server-amd64.iso: Specifies the source ISO file for Ubuntu 22.04.2 Live Server AMD64.
# -x /data/extras: Specifies a folder containing additional files and folders to be copied into the root of the ISO image.
# Run the Docker command with variables
docker run --privileged --rm \
    --volume "$DATA_DIRECTORY:/data" deserializeme/pxeless \
    -a -u "$AUTOINSTALL_FILE" \
    -s "$SOURCE_ISO" \
    -x "$EXTRAS_FOLDER" \
    --offline-installer installer-sample.sh

# Reference:
# docker run --privileged --rm \
#     --volume "$(pwd):/data" cloudymax/pxeless \
#         -a -u autoinstall.yaml \
#         -s ubuntu-22.04.2-live-server-amd64.iso \
#         -x /data/extras

# Overall, this command builds a custom Ubuntu ISO image with autoinstall configuration,
# additional files, and packages according to the specified options.


