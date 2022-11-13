import QtQuick
import QtQuick.Controls

LoopBaseButton {
    id: control
    icon.source: "image://svgmodifier/example.mixxx.org/imports/LateNight/assets/icons/loop_out.svg?#000000/" + (control.pressed ? "#000000" : "#908070")
}
