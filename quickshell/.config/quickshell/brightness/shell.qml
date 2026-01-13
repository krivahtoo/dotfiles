import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Widgets
import Quickshell.Io

Scope {
    id: root

    property int brightness: 0
    property bool shouldShowOsd: false

    Process {
        id: lightProc
        command: ["light", "-G"]
        running: false

        stdout: StdioCollector {
            onStreamFinished: {
                const value = Math.round(parseFloat(text.trim()))
                if (value !== root.brightness) {
                    root.brightness = value
                    root.shouldShowOsd = true
                    hideTimer.restart()
                }
            }
        }
    }
    Process {
        id: setBrightnessProc
        running: false
    }

    // ---- Polling trigger ----
    Timer {
        interval: 150
        running: true
        repeat: true
        onTriggered: {
            if (!lightProc.running) {
                lightProc.running = true
            }
        }
    }

    // ---- Auto-hide ----
    Timer {
        id: hideTimer
        interval: 1000
        onTriggered: shouldShowOsd = false
    }

    LazyLoader {
        active: shouldShowOsd

        PanelWindow {
            anchors.bottom: true
            margins.bottom: 100
            exclusiveZone: 0
            implicitWidth: 400
            implicitHeight: 50
            color: "transparent"
            // mask: Region {}

            Rectangle {
                anchors.fill: parent
                radius: 10
                color: "#80000000"
                border.color: "#475ad2"
                border.width: 1

                RowLayout {
                    anchors.fill: parent
                    anchors.leftMargin: 10
                    anchors.rightMargin: 15

                    IconImage {
                        implicitSize: 20
                        source: {
                          if (brightness === 0)
                              return Quickshell.iconPath("display-brightness-off-symbolic", true)
                          else if (brightness < 30)
                              return Quickshell.iconPath("display-brightness-low-symbolic", true)
                          else if (brightness < 70)
                              return Quickshell.iconPath("display-brightness-medium-symbolic", true)
                          else
                              return Quickshell.iconPath("display-brightness-high-symbolic", true)
                        }
                    }

                    Rectangle {
                        Layout.fillWidth: true
                        implicitHeight: 10
                        radius: 20
                        color: "#082034"

                        Rectangle {
							anchors {
								left: parent.left
								top: parent.top
								bottom: parent.bottom
							}
                            // anchors.fill: parent
                            // anchors.rightMargin: parent.width * (1 - brightness / 100)
                            implicitWidth: parent.width * (brightness / 100)
                            radius: parent.radius
                            color: "#586afc"

                            Behavior on implicitWidth {
                                NumberAnimation {
                                    duration: 120
                                    easing.type: Easing.OutCubic
                                }
                            }
                        }
                        
                        MouseArea {
                            anchors.fill: parent
                            hoverEnabled: true
                            cursorShape: Qt.PointingHandCursor

                            function setBrightness(mouseX) {
                                const percent = Math.max(1, Math.min(100,
                                    Math.round((mouseX / width) * 100)
                                ))

                                setBrightnessProc.command = ["light", "-S", percent.toString()]
                                setBrightnessProc.running = true
                            }

                            onPressed: mouse => { setBrightness(mouse.x) }
                            onPositionChanged: if (pressed) setBrightness(mouse.x)
                        }
                    }

                    Text {
                        text: brightness + "%"
                        color: "#769aaa"
                    }
                }
            }
        }
    }
}
