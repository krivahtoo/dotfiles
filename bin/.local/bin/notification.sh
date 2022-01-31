# 
# DUNST_APP_NAME, DUNST_SUMMARY, DUNST_BODY, DUNST_ICON_PATH,
# DUNST_URGENCY, DUNST_ID, DUNST_PROGRESS, DUNST_CATEGORY,
# DUNST_STACK_TAG, DUNST_URLS, DUNST_TIMEOUT, DUNST_TIMESTAMP and DUNST_STACK_TAG.
#
# Or
#
# `./notification.sh appname summary body icon_path urgency`

case "$DUNST_URGENCY" in
  LOW)
    #mpv /usr/share/sounds/Oxygen-Im-Sms.ogg &>/dev/null
    ;;
  NORMAL)
    case "$DUNST_APP_NAME" in
      Music|MPD|Scrot)
        ;;
      Volume)
        paplay /usr/share/sounds/freedesktop/stereo/audio-volume-change.oga &>/dev/null
        ;;
      'Telegram Desktop')
        # Telegram Desktop has a cool notification sound. :)
        ;;
      *)
        paplay /usr/share/sounds/freedesktop/stereo/message.oga &>/dev/null
    esac
    ;;
  CRITICAL)
    paplay /usr/share/sounds/Oxygen-Sys-App-Error.ogg &>/dev/null
    ;;
esac


