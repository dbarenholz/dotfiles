#!/bin/zsh

# Only run this for X sessions
if [ "$XDG_SESSION_TYPE" = "x11" ]; then
  sleep 5
  touch $HOME/.Xdbus
  chmod 600 $HOME/.Xdbus
  env | grep DBUS_SESSION_BUS_ADDRESS > $HOME/.Xdbus
  echo 'export DBUS_SESSION_BUS_ADDRESS' >> $HOME/.Xdbus
  # Export XAUTHORITY value on startup so it can be used by cron
  env | grep XAUTHORITY >> $HOME/.Xdbus
  echo 'export XAUTHORITY' >> $HOME/.Xdbus
fi
