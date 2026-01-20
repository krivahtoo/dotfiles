import QtQuick
import QtQuick.Layouts
import Quickshell.Widgets

Item {
    property var player
    property int playerStatus

    Layout.alignment: Qt.AlignHCenter
    width: 200
    height: 200

    readonly property real albumRadius: 74
    readonly property real barThickness: 2
    readonly property real barMin: 8
    readonly property real barMax: 36

    Repeater {
        model: 48

        Rectangle {
            width: barThickness
            radius: barThickness / 2
            color: "#6a7cff"
            opacity: playerStatus === 1 ? 0.9 : 0.25

            x: albumArt.x + albumArt.width / 2 - width / 2
            y: albumArt.y - height - 8
            transformOrigin: Item.Bottom

            transform: Rotation {
                angle: index * (360 / 48)
                origin.x: width - 2
                origin.y: albumRadius + height + 8
            }

            SequentialAnimation on height {
                running: true
                loops: Animation.Infinite

                NumberAnimation {
                    to: playerStatus === 1
                        ? barMin + Math.random() * barMax
                        : barMin
                    duration: 180 + Math.random() * 180
                }

                NumberAnimation {
                    to: barMin
                    duration: 240
                }
            }
        }
    }

    ClippingRectangle {
        id: albumArt
        width: 148
        height: 148
        radius: width / 2
        anchors.centerIn: parent
        color: "#111"

        Image {
            anchors.fill: parent
            source: player?.trackArtUrl ?? ""
            fillMode: Image.PreserveAspectCrop
            asynchronous: true
        }
    }
}
