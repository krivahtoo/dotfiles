import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Io
import Quickshell.Services.Pipewire
import Quickshell.Widgets

Scope {
	id: root

	// Bind the pipewire node so its volume will be tracked
	PwObjectTracker {
		objects: [ Pipewire.defaultAudioSink ]
	}
    
    Process {
        id: volumeSound
        command: [
            "paplay",
            "/usr/share/sounds/freedesktop/stereo/audio-volume-change.oga"
        ]
    }

	Connections {
		target: Pipewire.defaultAudioSink?.audio

		function onVolumeChanged() {
			root.shouldShowOsd = true;
			hideTimer.restart();

            if (!Pipewire.defaultAudioSink.audio.muted && !volumeSound.running)
                volumeSound.running = true
		}
	}

	property bool shouldShowOsd: false

	Timer {
		id: hideTimer
		interval: 1000
		onTriggered: root.shouldShowOsd = false
	}

	// The OSD window will be created and destroyed based on shouldShowOsd.
	// PanelWindow.visible could be set instead of using a loader, but using
	// a loader will reduce the memory overhead when the window isn't open.
	LazyLoader {
		active: root.shouldShowOsd

		PanelWindow {
			// Since the panel's screen is unset, it will be picked by the compositor
			// when the window is created. Most compositors pick the current active monitor.

			anchors.bottom: true
			margins.bottom: 100
			exclusiveZone: 0

			implicitWidth: 400
			implicitHeight: 50
			color: "transparent"

			// An empty click mask prevents the window from blocking mouse events.
			// mask: Region { item: bar; intersection: Intersection.Combine }

			Rectangle {
				anchors.fill: parent
				radius: 10
				color: "#f0070e1e"
                border.color: "#475ad2"
                border.width: 1

				RowLayout {
					anchors {
						fill: parent
						leftMargin: 10
						rightMargin: 15
					}

					IconImage {
						implicitSize: 20
                        source: {
                            const sink = Pipewire.defaultAudioSink
                            const vol = sink?.audio.volume ?? 0
                            const muted = sink?.audio.muted ?? false

                            if (muted || vol === 0)
                                return Quickshell.iconPath("audio-volume-muted-symbolic", true)
                            else if (vol < 0.33)
                                return Quickshell.iconPath("audio-volume-low-symbolic", true)
                            else if (vol < 0.66)
                                return Quickshell.iconPath("audio-volume-medium-symbolic", true)
                            else
                                return Quickshell.iconPath("audio-volume-high-symbolic", true)
                        }

                        Behavior on source {
                            PropertyAnimation { duration: 100 }
                        }
					}

                    Rectangle {
                        id: bar
						// Stretches to fill all left-over space
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
						    
                            color: "#586afc"

							implicitWidth: parent.width * (Pipewire.defaultAudioSink?.audio.volume ?? 0)
							radius: parent.radius

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

                            function setVolume(mouseX) {
                                const ratio = Math.max(0, Math.min(1, mouseX / width))
                                if (Pipewire.defaultAudioSink)
                                    Pipewire.defaultAudioSink.audio.volume = ratio
                            }

                            onPressed: mouse => { setVolume(mouse.x) }
                            onPositionChanged: if (pressed) setVolume(mouse.x)

                            cursorShape: Qt.PointingHandCursor
                        }
					}
                    Text {
                        text: Math.round(100 * (Pipewire.defaultAudioSink?.audio.volume ?? 0)) + "%"
                        color: "#769aaa"
                    }

				}
			}
		}
	}
}
