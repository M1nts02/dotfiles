function m() {
  local cmd="$1"
  shift
  case "$cmd" in
    disablesleep)
      [[ "${$(pmset -g | grep SleepDisabled): -1}" == "0" ]] && sudo pmset -a disablesleep 1 || sudo pmset -a disablesleep 0
      [[ "${$(pmset -g | grep SleepDisabled): -1}" == "0" ]] && echo "disablesleep trun off" || echo "disablesleep trun on"
      ;;
    darkmode)
      osascript -e 'tell app "System Events" to tell appearance preferences to set dark mode to not dark mode'
      ;;
    proxy)
      if [[ -n "$http_proxy" ]]; then
        unset http_proxy https_proxy
        echo "HTTP Proxy off"
      else
        export http_proxy="http://127.0.0.1:7890"
        export https_proxy="http://127.0.0.1:7890"
        echo "HTTP Proxy on"
      fi
      ;;
    disk)
      local -a disks
      disks=$(diskutil list | grep -E external | awk '{print $1}')

      if [[ ${#disks} -eq 0 ]]; then
        echo "No external disks found"
        return 0
      fi

      local -a volumes states names
      for disk in $disks; do
        for part in $(diskutil list $disk | awk '/^[ ]+[0-9]+:/{print $NF}'); do
          [[ "$part" == "${disk#/dev/}" ]] && continue

          local info=$(diskutil info /dev/$part 2>/dev/null)
          local name=$(echo "$info" | sed -n 's/.*Volume Name: *//p')
          local mounted=$(echo "$info" | sed -n 's/.*Mounted: *//p')

          [[ "$name" == "Not applicable (no file system)" ]] && continue
          [[ "$name" == "EFI" ]] && continue

          volumes+=($part)
          names+=("$name")
          states+=("$mounted")
        done
      done

      if [[ ${#volumes} -eq 0 ]]; then
        echo "No mountable volumes found on external disks"
        return 0
      fi

      echo "External Volumes:"
      local i
      for ((i=1; i<=${#volumes}; i++)); do
        local mount_status="unmounted"
        [[ "${states[$i]}" == "Yes" ]] && mount_status="mounted"
        printf "  %d. %-20s [%s] (%s)\n" $i "${names[$i]}" "$mount_status" "${volumes[$i]}"
      done

      echo ""
      echo -n "Select volume to mount/eject (1-${#volumes}), or q to quit: "
      local choice
      read choice

      [[ "$choice" == "q" ]] && return 0
      [[ ! "$choice" =~ ^[0-9]+$ ]] || [[ $choice -lt 1 || $choice -gt ${#volumes} ]] && { echo "Invalid selection"; return 1; }

      local dev="${volumes[$choice]}"
      local state="${states[$choice]}"
      local volname="${names[$choice]}"

      if [[ "$state" == "Yes" ]]; then
        echo "Ejecting $volname..."
        diskutil eject /dev/$dev
      else
        echo "Mounting $volname..."
        diskutil mount /dev/$dev
      fi
      ;;
    *)
      echo "Unknown command: $cmd" >&2
      return 1
      ;;
  esac
}

function _m() {
  local -a commands
  commands=(
    'disablesleep:Toggle sleep disable'
    'darkmode:Toggle dark mode'
    'proxy:Toggle HTTP proxy'
    'disk:Mount/eject external disks'
  )
  _describe 'command' commands
}
compdef _m m
