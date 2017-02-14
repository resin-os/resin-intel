#!/bin/sh

PATH=/sbin:/bin:/usr/sbin:/usr/bin

udev_daemon() {
	OPTIONS="/sbin/udev/udevd /sbin/udevd /lib/udev/udevd /lib/systemd/systemd-udevd"

	for o in $OPTIONS; do
		if [ -x "$o" ]; then
			echo $o
			return 0
		fi
	done

	return 1
}

_UDEV_DAEMON=`udev_daemon`

early_setup() {
    mkdir -p /proc
    mkdir -p /sys
    mount -t proc proc /proc
    mount -t sysfs sysfs /sys
    mount -t devtmpfs none /dev

    mkdir -p /run
    mkdir -p /var/run

    $_UDEV_DAEMON --daemon
    udevadm trigger
    udevadm settle
}

read_args() {
    [ -z "$CMDLINE" ] && CMDLINE=`cat /proc/cmdline`
    for arg in $CMDLINE; do
        optarg=`expr "x$arg" : 'x[^=]*=\(.*\)'`
        case $arg in
            LABEL=*)
                label=$optarg ;;
        esac
    done
}

boot_rootfs() {
   local _what=$1

    echo "init-external-media.sh: Waiting for udev to populate /dev/disk/by-label/$_what... "
    while true
    do
        if ls -A /dev/disk/by-label/$_what >/dev/null 2>&1; then
            break
        fi
        sleep 1
    done
    echo "init-external-media.sh: Found $_what label."

    mkdir /$_what
    mount /dev/disk/by-label/$_what /$_what
    # Watches the udev event queue, and exits if all current events are handled
    killall "${_UDEV_DAEMON##*/}" 2>/dev/null

    exec switch_root /$_what /sbin/init ||
        fatal "init-external-media.sh: Couldn't switch_root, dropping to shell"
}

fatal() {
    echo $1 >$CONSOLE
    echo >$CONSOLE
    exec sh
}

early_setup

[ -z "$CONSOLE" ] && CONSOLE="/dev/console"

read_args

# unmount the USB partitions from /run/media/ (to be checked in the future if we will disable this automounting behaviour)
umount /run/media/* 2>/dev/null

case $label in
    flash)
        boot_rootfs flash-root
        ;;
    *)
        boot_rootfs $label
        ;;
esac
