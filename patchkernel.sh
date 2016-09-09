#!/bin/bash

# Sources have already been patched with latest (samsung) L/M release DTS and Firmware files:
# * the diff on M alone is 600+ LOC, much easir to just include files, then patch for it.
#

echo "

Applying MISC KLTE/Galaxy S5 Kernel Patches

"
# Samsung sm-g900w8 MM sources
patch -Np1 < ./patches/qdsp6v2_mm_fixup.patch 
# CopperHeadOS github
patch -Np1 < ./patches/4-random-mac.patch
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
# Upstream backport
patch -Np1 < ./patches/22-writeback_sync.patch
# RolanDroid github
patch -Np1 < ./patches/23-neon_kernel_mode.patch
# HTC code / from github
patch -Np1 < ./patches/26-Port_HTC_MDP_color_enhancement_feature.patch
# Faux123 / github
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
# Samsung / sm-g900s *M* kernel updates
patch -Np1 < ./patches/ZZZ-sound.patch
# Better ASLR support
patch -Np1 < ./patches/0CC-arm_mm_ARCH_MMAP_RND_BITS.patch
patch -Np1 < ./patches/1CC-arm_mm_mmap_base_ASLR.patch
patch -Np1 < ./patches/2CC-mm_ASLR_get_random_long.patch
patch -Np1 < ./patches/3CC-mm_ASLR_get_random_long_devRandom.patch
# SHA1 && SHA512 NEON instruction set
patch -Np1 < ./patches/0AA-crypto_neon1.patch
# perf_paranoid=3 grsec
patch -Np1 < ./patches/ZZZ-perf_event_paranoid3_grsec.patch
# gcc 5.x.x code fixups ** dont use with GCC < 5.x
patch -Np1 < ./patches/3.4-gcc5.patch
patch -Np1 < ./patches/more-3.4_gcc5x_fixups.patch
# Upstream Backport
patch -Np1 < ./patches/lx314-backport_fstackprotector_strong.patch
# Seccomp (secure computing /sandboxing)
patch -Np1 < ./patches/FFF-klte_seccomp-bpf.patch
# LTS n Google linux-3.4 fixups (mostly ARM)
patch -Np1 < ./patches/lx34LTS_google_fixups.patch
# mismatch section fixups needed for Linaro toolchain (gcc-5.2.1)
patch -Np1 < ./patches/XXX-section_mismatch_fixups_for_linaro-GCC-5.2.1.patch
# enable all my extra kernel features
patch -Np1 < ./patches/XXX-enable_my_extra_configs.patch

exit
