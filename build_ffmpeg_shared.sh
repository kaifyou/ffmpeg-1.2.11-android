#!/bin/bash
NDK=/home/sdduser/Android/android-ndk-r8e
SYSROOT=$NDK/platforms/android-14/arch-arm/
TOOLCHAIN=$NDK/toolchains/arm-linux-androideabi-4.4.3/prebuilt/linux-x86_64
function build_one
{
	./configure \
	--prefix=$PREFIX \
	--enable-shared \
	--disable-static \
	--extra-ldflags="-L$SYSROOT/usr/lib" \
	--disable-doc \
	--disable-ffmpeg \
	--disable-ffplay \
	--disable-ffprobe \
	--disable-ffserver \
	--enable-filter=amix \
	--enable-filter=scale \
	--cross-prefix=$TOOLCHAIN/bin/arm-linux-androideabi- \
	--target-os=linux \
	--arch=arm \
	--enable-cross-compile \
	--sysroot=$SYSROOT \
	$ADDITIONAL_CONFIGURE_FLAG
	make clean
	make
	make install

}
CPU=arm
PREFIX=$(pwd)/android/$CPU 
ADDI_CFLAGS="-marm"
build_one
