import QtQuick
import QtQuick.Layouts

ColumnLayout {
    property var player
    Layout.alignment: Qt.AlignHCenter
    spacing: 2

    Text {
        text: player?.trackTitle || "Unknown Title"
        color: "white"
        font.pixelSize: 15
        font.bold: true
        maximumLineCount: 2
        horizontalAlignment: Text.AlignHCenter
        wrapMode: Text.Wrap
        Layout.fillWidth: true
    }

    Text {
        text: player?.trackArtist || "Unknown Artist"
        color: "#9aa6ff"
        font.pixelSize: 12
        Layout.fillWidth: true
        horizontalAlignment: Text.AlignHCenter
    }

    Text {
        text: player?.trackAlbum || "Unknown Album"
        color: "#4b626a"
        font.pixelSize: 11
        Layout.fillWidth: true
        horizontalAlignment: Text.AlignHCenter
    }
}
