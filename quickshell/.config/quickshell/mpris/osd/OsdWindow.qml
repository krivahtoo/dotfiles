import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Widgets
import Quickshell.Services.Mpris

PanelWindow {
    id: window

    property var player
    property int playerStatus
    signal playerSelected(var player)

    anchors.bottom: true
    anchors.right: true
    margins.bottom: 32
    margins.right: 20
    exclusiveZone: 0

    implicitWidth: 300
    implicitHeight: 360
    color: "transparent"

    Rectangle {
        anchors.fill: parent
        radius: 16
        color: "#9f01101c"
        border.color: "#4c5cff"
        border.width: 1

        ColumnLayout {
            anchors.fill: parent
            anchors.margins: 14
            spacing: 2

            PlayerTabs {
                player: window.player
                onSelected: window.playerSelected(player)
            }

            AlbumVisualizer {
                player: window.player
                playerStatus: window.playerStatus
            }

            TrackInfo {
                player: window.player
            }

            PlaybackControls {
                player: window.player
                playerStatus: window.playerStatus
            }

            ProgressBar {
                player: window.player
            }
        }
    }
}
