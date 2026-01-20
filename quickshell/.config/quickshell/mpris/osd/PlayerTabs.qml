import QtQuick
import QtQuick.Layouts
import Quickshell.Services.Mpris

RowLayout {
    property var player
    signal selected(var player)

    Layout.alignment: Qt.AlignHCenter
    spacing: 6

    Repeater {
        model: Mpris.players

        Rectangle {
            radius: 8
            height: 26
            Layout.preferredWidth: Math.max(80, tabText.implicitWidth + 20)

            color: modelData === player ? "#586afc" : "#1a1f3a"
            border.color: "#586afc"
            border.width: modelData === player ? 0 : 1

            Behavior on color { ColorAnimation { duration: 180 } }

            Text {
                id: tabText
                anchors.centerIn: parent
                text: modelData.identity
                font.pixelSize: 11
                color: modelData === player ? "white" : "#9aa6ff"
                elide: Text.ElideRight
            }

            MouseArea {
                anchors.fill: parent
                cursorShape: Qt.PointingHandCursor
                onClicked: selected(modelData)
            }
        }
    }
}
