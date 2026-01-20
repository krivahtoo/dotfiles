import QtQuick
import Quickshell
import Quickshell.Services.Mpris

import "osd"

Scope {
    id: root

    property bool shouldShowOsd: false
    property var player: Mpris.players.values[0]
    property var playerplayerStatus: MprisPlaybackState.Paused

    Connections {
        target: player
        enabled: player !== null

        function showOsd() {
            playerplayerStatus = player.playbackState
            shouldShowOsd = true
            hideTimer.restart()
        }

        function onMetadataChanged()      { showOsd() }
        function onPostTrackChanged()     { showOsd() }
        function onPlaybackStateChanged() { showOsd() }
    }

    Component.onCompleted: {
        if (!player && Mpris.players.count > 0)
            player = Mpris.players.values[0]
    }

    Timer {
        id: hideTimer
        interval: 5000
        onTriggered: shouldShowOsd = false
    }

    Timer {
        running: player && player.playbackState === MprisPlaybackState.Playing
        interval: 1000
        repeat: true
        onTriggered: player.positionChanged()
    }

    LazyLoader {
        active: shouldShowOsd && player !== null

        OsdWindow {
            player: root.player
            playerStatus: root.playerplayerStatus
            onPlayerSelected: root.player = player
        }
    }
}
