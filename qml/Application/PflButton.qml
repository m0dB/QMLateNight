import QtQuick
import QtQuick.Controls

Button {
    id: control
    implicitWidth: 24
    implicitHeight: 24
    color: control.checked ? "#808080" : "transparent"
    onPressed: control.toggle()
    onReleased: {
    }
    onClicked: {
    }
    icon.source: "image://svgmodifier/example.mixxx.org/imports/LateNight/assets/icons/pfl.svg?#ff0000/" + (control.checked ? "#000000" : "#908070")
}
