import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Io
import Quickshell.Widgets
import Quickshell.Services.Mpris

Scope {
    id: root

    property bool shouldShowOsd: false

    // Active player (Quickshell picks the best one automatically)
    property var player: Mpris.players.values[0]
    property var playerplayerStatus: MprisPlaybackState.Paused

    property string currentTitle: "Unknown Title"
    property string currentArtist: "Unknown Artist"
    property string currentArt: ""

    // ---- Track change detection ----
    Connections {
        target: player
        enabled: player !== null

        function syncMetadata() {
            if (!player) return

            currentTitle = player.trackTitle || "Unknown Title"
            currentArtist = player.trackAlbumArtist || player.trackArtist || "Unknown Artist"
            currentArt = player.trackArtUrl || ""
        }

        function showOsd() {
            syncMetadata()
            playerplayerStatus = player.playbackState
            shouldShowOsd = true
            hideTimer.restart()
        }

        function onMetadataChanged() {
            showOsd()
        }

        function onPostTrackChanged() {
            showOsd()
        }

        function onPlaybackStateChanged() {
            showOsd()
        }
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

    LazyLoader {
        active: shouldShowOsd && player !== null

        onActiveChanged: {
            if (active && player) {
                // force reevaluation of bindings
                player.trackTitleChanged()
            }
        }

        PanelWindow {
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
                //color: "#88000000"
                color: "#9f01101c"
                border.color: "#4c5cff"
                border.width: 1

                ColumnLayout {
                    anchors.fill: parent
                    anchors.margins: 14
                    spacing: 2


                    // ===== Player Tabs =====
                    RowLayout {
                        Layout.fillWidth: true
                        Layout.alignment: Qt.AlignHCenter
                        spacing: 6

                        Repeater {
                            model: Mpris.players

                            Rectangle {
                                radius: 8
                                height: 26
                                Layout.preferredWidth: Math.max(80, tabText.implicitWidth + 20)

                                color: modelData === player
                                    ? "#586afc"
                                    : "#1a1f3a"

                                border.color: "#586afc"
                                border.width: modelData === player ? 0 : 1

                                Behavior on color {
                                    ColorAnimation { duration: 180 }
                                }

                                Text {
                                    id: tabText
                                    anchors.centerIn: parent
                                    text: modelData.identity
                                    font.pixelSize: 11
                                    color: modelData === player ? "white" : "#9aa6ff"
                                    elide: Text.ElideRight
                                    horizontalAlignment: Text.AlignHCenter
                                }

                                MouseArea {
                                    anchors.fill: parent
                                    cursorShape: Qt.PointingHandCursor

                                    onClicked: {
                                        player = modelData
                                        syncMetadata()
                                    }
                                }
                            }
                        }
                    }

                    // ===== Album art + visualizer =====
                    Item {
                        Layout.alignment: Qt.AlignHCenter
                        width: 200
                        height: 200
                        

                        readonly property real albumRadius: 74
                        readonly property real barThickness: 2
                        readonly property real barMin: 8
                        readonly property real barMax: 36

                        // ---- Visualizer ----
                        Repeater {
                            model: 48

                            Rectangle {
                                width: parent.barThickness
                                // height: parent.barMin
                                radius: parent.barThickness / 2
                                color: "#6a7cff"

                                opacity: playerplayerStatus === MprisPlaybackState.Playing ? 0.9 : 0.25

                                Behavior on opacity {
                                    NumberAnimation { duration: 250 }
                                }

                                // 🔑 THIS IS THE KEY
                                x: albumArt.x + albumArt.width / 2 - width / 2
                                y: albumArt.y - height - 8
                                transformOrigin: Item.Bottom

                                transform: Rotation {
                                    angle: index * (360 / 48)
                                    origin.x: width - 2
                                    origin.y: parent.albumRadius + height + 8
                                }

                                SequentialAnimation on height {
                                    running: true
                                    loops: Animation.Infinite

                                    NumberAnimation {
                                        to: playerplayerStatus === MprisPlaybackState.Playing
                                          ? parent.barMin + Math.random() * parent.barMax
                                          : parent.barMin
                                        duration: playerplayerStatus === MprisPlaybackState.Playing
                                            ? 180 + Math.random() * 180
                                            : 300
                                        easing.type: Easing.InOutQuad
                                    }
                                    NumberAnimation {
                                        to: parent.barMin
                                        duration: playerplayerStatus === MprisPlaybackState.Playing ? 240 : 300
                                        easing.type: Easing.InOutQuad
                                    }
                                }
                            }
                        }

                        // --- Album art ---
                        ClippingRectangle {
                            id: albumArt
                            width: 148
                            height: 148
                            radius: width / 2
                            color: "#111"
                            anchors.centerIn: parent

                            Image {
                                anchors.fill: parent
                                source: player.trackArtUrl ?? ""
                                fillMode: Image.PreserveAspectCrop
                                smooth: true
                                asynchronous: true
                            }
                        }


                    }

                    // ===== Track text =====
                    ColumnLayout {
                        Layout.alignment: Qt.AlignHCenter
                        spacing: 2

                        Text {
                            text: currentTitle
                            color: "white"
                            font.pixelSize: 15
                            font.bold: true
                            maximumLineCount: 2
                            horizontalAlignment: Text.AlignHCenter
                            elide: Text.ElideRight
                            wrapMode: Text.Wrap
                            Layout.fillWidth: true
                        }

                        Text {
                            text: currentArtist
                            color: "#9aa6ff"
                            font.pixelSize: 12
                            maximumLineCount: 2
                            horizontalAlignment: Text.AlignHCenter
                            elide: Text.ElideRight
                            wrapMode: Text.Wrap
                            Layout.fillWidth: true
                        }

                        Text {
                            text: player.trackAlbum || "Unknown Album"
                            color: "#4b626a"
                            font.pixelSize: 11
                            maximumLineCount: 2
                            horizontalAlignment: Text.AlignHCenter
                            elide: Text.ElideRight
                            wrapMode: Text.Wrap
                            Layout.fillWidth: true
                        }
                    }

                    // ===== Controls =====
                    RowLayout {
                        Layout.alignment: Qt.AlignHCenter
                        spacing: 18

                        IconImage {
                            implicitSize: 20
                            source: Quickshell.iconPath("media-skip-backward-symbolic", true)
                            MouseArea {
                                anchors.fill: parent
                                onClicked: player.previous()
                            }
                        }

                        IconImage {
                            implicitSize: 26
                            source: playerplayerStatus === MprisPlaybackState.Playing
                                ? Quickshell.iconPath("media-playback-pause-symbolic", true)
                                : Quickshell.iconPath("media-playback-start-symbolic", true)

                            MouseArea {
                                anchors.fill: parent
                                onClicked: {
                                    if (!player.canTogglePlaying)
                                        return

                                    player.togglePlaying()
                                }
                            }
                        }

                        IconImage {
                            implicitSize: 20
                            source: Quickshell.iconPath("media-skip-forward-symbolic", true)
                            MouseArea {
                                anchors.fill: parent
                                onClicked: player.next()
                            }
                        }
                    }
                }
            }
        }
    }
}
