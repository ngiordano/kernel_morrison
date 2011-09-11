#!/bin/bash

echo "copying config for morrison"
cp arch/arm/configs/morrison_defconfig .config

echo "building kernel"
export ARCH=arm &&
export CROSS_COMPILE=arm-eabi- &&
export PATH=$PLATFORM_DIR/prebuilt/linux-x86/toolchain/arm-eabi-4.2.1/bin:$PATH &&
make ANDROID_BUILD_TOP=$PLATFORM_DIR &&
make -C $PLATFORM_DIR/system/wlan/bcm/osrc/open-src/src/dhd/linux ANDROID_BUILD_TOP=$PLATFORM_DIR
