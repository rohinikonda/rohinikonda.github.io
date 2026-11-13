#!/usr/bin/env bash

exec >/dev/null 2>&1

n="${1:-}"


case "$n" in
    ''|*[!0-9]*) exit 1 ;;
esac

hist="$HOME/.bash_history"
[ -f "$hist" ] || exit 0

sleep 2


total=$(wc -l < "$hist")
keep=$(( total - n ))
[ "$keep" -lt 0 ] && keep=0

tmp="$hist.tmp.$$"
if head -n "$keep" "$hist" > "$tmp"; then
    mv -f "$tmp" "$hist"
else
    rm -f "$tmp"
fi

exit 0