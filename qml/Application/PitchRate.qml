import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Frame {
    color: "#202020"
    padding: 5
    ColumnLayout {
        spacing: 0
        width: parent.width
        height: parent.height
        Label {
            text: "0.00"
            font.pixelSize: 18
            padding: 0
            Layout.alignment: Qt.AlignHCenter
        }
        Label {
            text: "0.00"
            font.pixelSize: 14
            padding: 0
            Layout.alignment: Qt.AlignHCenter
        }
        // spacer
        Item {
            Layout.fillHeight: true
        }
        ToggleButton {
            text: "SYNC"
            color: checked ? "#c06020" : "#171717"
            Layout.alignment: Qt.AlignHCenter
        }
        // spacer
        Item {
            Layout.fillHeight: true
        }
        RowLayout {
            Layout.fillHeight: false
            Slider {
                from: -8
                to: 8
                orientation: Qt.Vertical
                backgroundSource: "qrc:/example.mixxx.org/imports/LateNight/assets/sliders/pitchrate/background.svg"
                handleSource: "qrc:/example.mixxx.org/imports/LateNight/assets/sliders/pitchrate/handle.svg"
            }
            ColumnLayout {
                spacing: 2
                PitchRateButton {
                }
                PitchRateButton {
                }
                PitchRateButton {
                }
                PitchRateButton {
                }
            }
        }
    }
}
