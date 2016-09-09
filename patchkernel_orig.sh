#!/bin/bash

echo "Applying MISC KLTE/Galaxy S5 Kernel Patches"

# Samsung sm-g900w8 LL sources
patch -Np1 < ./patches/0-qdsp6v2_avtimer_sound.patch
patch -Np1 < ./patches/1-msm_unified_gpu_and_sync_fence_log.patch
patch -Np1 < ./patches/2-fingerprint_driver.patch
patch -Np1 < ./patches/3-slimbus.patch
# CopperHeadOS github
patch -Np1 < ./patches/4-random-mac.patch
# Samsung sm-g900w8 LL sources
patch -Np1 < ./patches/7-video_mdss_mdnie.patch
# Upstream backports
patch -Np1 < ./patches/0014-lib-int_sqrt.c-optimize-square-root-algorithm.patch
patch -Np1 < ./patches/10-camera-v4l2-lx35_backports_rev2.patch
patch -Np1 < ./patches/11-softirq_reduce_latencies.patch
patch -Np1 < ./patches/13-futex_cleanup_larger_table.patch   
# Github - Arm/android kernels in a few repos
patch -Np1 < ./patches/14-optimizedARM-rwsem.patch 
# Fixup Samsung type mismatch / Faux123 github
patch -Np1 < ./patches/15-fix_samsung_types-mismatch.patch
# 2015 Nvidia powersaving tweak/patch
patch -Np1 < ./patches/17-nvidia_power_efficiently_tweak.patch
# Upstream Backport / pulled from github
patch -Np1 < ./patches/18-rwsem_mutex_scaling.patch 
# billchen1977/kernel_msm github 
patch -Np1 < ./patches/20-usb_fastcharge.patch
patch -Np1 < ./patches/21-usb_gadget_midi.patch
# Upstream backport
patch -Np1 < ./patches/22-writeback_sync.patch
# RolanDroid github
patch -Np1 < ./patches/23-neon_kernel_mode.patch
# HTC code / from github
patch -Np1 < ./patches/26-Port_HTC_MDP_color_enhancement_feature.patch
# Fix Compilation with Linaro toolchain (4.9.4)
patch -Np1 < ./patches/27-for_lenaro_kernel_gcc_fix.patch
# Faux123 / github
patch -Np1 < ./patches/0094-ASoc-Reduce-number-of-periods-in-low-latency-driver.patch
patch -Np1 < ./patches/0095-ASoc-msm-Increase-max-buffer-size-to-4k-lowlaten.patch
patch -Np1 < ./patches/0096-ASoC-msm-Reduce-min-buffer-size-low-latency.patch
patch -Np1 < ./patches/0097-ASoC-msm-Change-QOS-value-low-latency-path.patch
# chil360/chil360-kernel / github
patch -Np1 < ./patches/0003-Neon-instead-of-softvfp-vfp.patch
patch -Np1 < ./patches/0002-Makefile-O3-snapdragon-linaro-optimizations.patch
patch -Np1 < ./patches/0582-Makefile-neon-vfpv4-instead-of-neon-only.patch
# labobj / github
patch -Np1 < ./patches/0071-SCHEDULER-Autogroup-patch-group-by-current-user-andr.patch
patch -Np1 < ./patches/0079-Revert-qualcomm-s-contributions-on-mutex.h.patch
patch -Np1 < ./patches/0080-ARM-7467-1-mutex-use-generic-xchg-based-implementati.patch
patch -Np1 < ./patches/0279-Makefile-fix-flags.patch
# flar2 / github
patch -Np1 < ./patches/0003-Add-dev-frandom-support.patch
patch -Np1 < ./patches/0004-lib-memcopy-use-glibc-version.patch
patch -Np1 < ./patches/0005-lib-string-use-glibc-version.patch
# FrancescoCG/CrazySuperKernel-TW
patch -Np1 < ./patches/765-stream-write-perf.patch
patch -Np1 < ./patches/766-bcmhd_reduce-wakelocks.patch
# add gcc 5.x compiler support (needed by linaro/gcc 5.2.1 toolchain)
patch -Np1 < ./patches/compiler-gcc5.patch
# Samsung / sm-g900s *MM* kernel updates
patch -Np1 < ./patches/XXX-drbg1.patch
patch -Np1 < ./patches/XXX-drbg2.patch
# Samsung / sm-g900s *MM* kernel updates
patch -Np1 < ./patches/ZZZ-cpufreq.patch
patch -Np1 < ./patches/ZZZ-crypto_chainiv_drbg.patch
patch -Np1 < ./patches/ZZZ-crypto_drbg.h.patch
patch -Np1 < ./patches/ZZZ-exfat.patch
patch -Np1 < ./patches/ZZZ-sound.patch
# Better ASLR support
patch -Np1 < ./patches/0CC-arm_mm_ARCH_MMAP_RND_BITS.patch
patch -Np1 < ./patches/1CC-arm_mm_mmap_base_ASLR.patch
patch -Np1 < ./patches/2CC-mm_ASLR_get_random_long.patch
patch -Np1 < ./patches/3CC-mm_ASLR_get_random_long_devRandom.patch
# SHA1 && SHA512 NEON instruction set
patch -Np1 < ./patches/0AA-crypto_neon1.patch
# gcc 5.x.x code fixups ** dont use with GCC < 5.x
patch -Np1 < ./patches/3.4-gcc5.patch
# Replace v1_edp_mdnie_data.h with samsung's version 
cp ./patches/v1_edp_mdnie_data.h ./drivers/video/msm/mdss/v1_edp_mdnie_data.h
# replace klte config with my config
cp ./patches/msm8974pro_sec_klte_eur_defconfig ./arch/arm/configs/msm8974pro_sec_klte_eur_defconfig
exit
