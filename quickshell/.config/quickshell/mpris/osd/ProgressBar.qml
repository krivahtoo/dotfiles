import QtQuick
import QtQuick.Layouts

ColumnLayout {
    property var player

    Layout.fillWidth: true
    visible: player && player.positionSupported

    function formatTime(sec) {
        if (!sec || sec <= 0) return "0:00"
        const m = Math.floor(sec / 60)
        const s = Math.floor(sec % 60)
        return m + ":" + (s < 10 ? "0" + s : s)
    }

    RowLayout {
        Layout.fillWidth: true

        Text { text: formatTime(player.position); font.pixelSize: 9; color: "#a38d90" }
        Item { Layout.fillWidth: true }
        Text { text: formatTime(player.length); font.pixelSize: 9; color: "#a38d90" }
    }

    Item {
        Layout.fillWidth: true
        height: 8

        Rectangle {
            anchors.fill: parent
            radius: height / 2
            color: "#0a1533"
        }

        Rectangle {
            width: parent.width * Math.min(1, player.position / player.length)
            height: parent.height
            radius: height / 2
            color: "#586afc"
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                if (!player.canSeek) return
                player.position = (mouse.x / width) * player.length
            }
        }
    }
}
