#!/bin/bash

qemu-system-aarch64 \
  -kernel linux-kernel-arm64-v5.16.0 \
  -m 256 -M virt \
  -cpu cortex-a53 \
  -append 'root=/dev/vda2 rw panic=1' \
  -drive "file=2022-01-28-raspios-bullseye-arm64-lite.img,if=none,index=0,media=disk,format=raw,id=disk0" \
  -device "virtio-blk-pci,drive=disk0,disable-modern=on,disable-legacy=off" \
  -device "virtio-net-pci,netdev=net0" \
  -netdev "user,id=net0,hostfwd=tcp::5022-:22" \
  -no-reboot -nographic

