#!/bin/bash
#
# Executions that need some if statements!
#

# Exit if a we are a virtual machine
if [[  $(lsmod | grep ^vmwgfx | wc -l) -gt 0 ]] ; then
  vmware-user-suid-wrapper &
  exit 0
fi

# Start xss-lock
if [[  $(pgrep -cx xss-lock) -eq 0 ]] ; then
  xset s 60 10  # Set 1mins and delay for 10secs
  locker="$HOME/.config/i3/scripts/i3lock.sh"
  xss-lock -n "$locker -n" -- $locker -f &
fi

# Start RedShift GTK
if [[  $(pgrep -cx redshift-gtk) -eq 0 ]] ; then
  redshift-gtk &
fi

# Polkit helper
if [[  $(pgrep -cx polkit-gnome-authentication-agent-1) -eq 0 ]] ; then
  /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
fi
