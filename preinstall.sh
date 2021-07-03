#!/bin/sh

DIR=$(dirname $0)
m4 "$DIR/install.sh.m4" > "$DIR/install.sh"
chmod 755 "$DIR/install.sh"

#for d in $(ls -d "$DIR/" | tr -d /)
#do
#cat <<EOS >> "$DIR/install.sh"
#"$d")
#. "$d/install.sh" ;;
#EOS
#done
#
#cat <<EOS
#*)
#echo "error" ;;
#esac
#EOS
