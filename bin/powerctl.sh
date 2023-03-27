#! /bin/bash
#
send_notification() {
    /usr/bin/sudo -u rtkay DISPLAY=:0 DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus /usr/bin/notify-send "$1" "battery level -> [${3}]" -i "$2"
}

get_battery() {
    battery=$(cat /sys/class/power_supply/BAT0/capacity)
    icon=""
    if [ $battery -gt 80 ]
    then
        icon="battery-080"
    elif [ $battery -gt 60 ]
    then
        icon="battery-060"
    elif [ $battery -gt 40 ]
    then
        icon="battery-040"
    elif [ $battery -gt 20 ]
    then
        icon="battery-020"
    else
        icon="battery-000"
    fi
    echo $icon $battery
}

case $1 in
  on)
    read battery percentage < <(get_battery)
    icon="${battery}-charging"

    send_notification "Switching to balanced mode" $icon $percentage
    # enable blur and animations
    sed -i 's/blur = no/blur = yes/g;s/enabled = no/enabled = yes/' /home/rtkay/.config/hypr/hyprland.conf
    sed -i '/opacity:/s/^#*//' /home/rtkay/.config/alacritty/alacritty.yml
    system76-power profile balanced
    light -S 40
    is_active=$(systemctl is-active docker.service)
    if [ $is_active = "inactive" ]
    then
      systemctl start docker.service
    fi
    ;;

  off)
    read icon percentage < <(get_battery)
    send_notification "Switching to power saving mode" $icon $percentage
    # disable blur and animations
    sed -i 's/blur = yes/blur = no/g;s/enabled = yes/enabled = no/' /home/rtkay/.config/hypr/hyprland.conf
    sed -i '/opacity:/s/^#*/#/g' /home/rtkay/.config/alacritty/alacritty.yml
    system76-power profile battery
    light -S 25
    lines=$(docker ps | wc -l)
    is_active=$(systemctl is-active docker.service)
    if [ $is_active = "active" -a $lines -lt 2 ]
    then
      systemctl stop docker.service
      systemctl stop docker.socket
      systemctl stop containerd
    fi
    ;;
esac
