#!/bin/sh

printf 'No\nYes\nRestart' | dmenu -p 'Poweroff? Are you sure?' | {
  read x
  case "$x" in
    No)
      exit 0
      ;;
    Yes)
      poweroff
      ;;
    Restart)
      reboot
      ;;
    *)
      exit 1
      ;;
  esac
}

