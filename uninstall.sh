#!/bin/sh
set -eu

# ref: https://www.task-notes.com/entry/20150214/1423882800
script_dir() {
	echo $(cd $(dirname $0) && pwd)
}
XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"

for arg in "$@"; do
	INSTALL_SCRIPT="`script_dir`/scripts/${arg}.install"
	
	[ -f "$INSTALL_SCRIPT" ] || {
		echo "error: ${INSTALL_SCRIPT} not found" 1>&2
		exit 1
	}
	
	. "$INSTALL_SCRIPT"
	
	uninstall
done
