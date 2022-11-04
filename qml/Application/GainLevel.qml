import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

ColumnLayout {
    spacing: 0
    Dial {
        from: -1
        to: 1
        color: "#c06020"
        Layout.alignment: Qt.AlignHCenter
    }
    Slider {
        orientation: Qt.Vertical
        backgroundSource: "qrc:/example.mixxx.org/imports/LateNight/assets/sliders/level/background.svg"
        handleSource: "qrc:/example.mixxx.org/imports/LateNight/assets/sliders/level/handle.svg"
    }
}
