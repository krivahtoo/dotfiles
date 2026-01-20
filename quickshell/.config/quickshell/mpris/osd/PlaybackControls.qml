import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Widgets
import Quickshell.Services.Mpris

RowLayout {
    property var player
    property int playerStatus

    Layout.alignment: Qt.AlignHCenter
    spacing: 20

    IconImage {
        implicitSize: 20
        source: player.shuffle
            ? Quickshell.iconPath("media-playlist-shuffle-symbolic", true)
            : Quickshell.iconPath("media-playlist-no-shuffle-symbolic", true)
    
        MouseArea {
          anchors.fill: parent;
          onClicked: {
            if (player.canControl && player.shuffleSupported) {
              player.shuffle = !player.shuffle
            }
          }
        }
    }

    IconImage {
        implicitSize: 20
        source: Quickshell.iconPath("media-skip-backward-symbolic", true)

        MouseArea {
          anchors.fill: parent;
          onClicked: player.canGoPrevious && player.previous()
        }
    }

    IconImage {
        implicitSize: 26
        source: playerStatus === MprisPlaybackState.Playing
            ? Quickshell.iconPath("media-playback-pause-symbolic", true)
            : Quickshell.iconPath("media-playback-start-symbolic", true)

        MouseArea {
            anchors.fill: parent
            onClicked: player.canTogglePlaying && player.togglePlaying()
        }
    }

    IconImage {
        implicitSize: 20
        source: Quickshell.iconPath("media-skip-forward-symbolic", true)
        MouseArea {
          anchors.fill: parent;
          onClicked: player.canGoNext && player.next()
        }
    }

    IconImage {
        implicitSize: 20
        source: {
          if (player.loopState === MprisLoopState.Playlist) 
            return Quickshell.iconPath("media-playlist-repeat-symbolic", true)
          else if (player.loopState === MprisLoopState.Track) 
            return Quickshell.iconPath("media-playlist-repeat-one-symbolic", true)
          else
            return Quickshell.iconPath("media-playlist-no-repeat-symbolic", true)
        }

        MouseArea {
          anchors.fill: parent;
          onClicked: {
            if (player.canControl && player.loopSupported) {
              if (player.loopState === MprisLoopState.None) 
                player.loopState = MprisLoopState.Playlist
              else if (player.loopState === MprisLoopState.Playlist) 
                player.loopState = MprisLoopState.Track
              else
                player.loopState = MprisLoopState.None
            }
          }
        }
    }
}
