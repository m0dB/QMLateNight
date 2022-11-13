import QtQuick
import QtQuick.Controls

IntroOutroButton {
    id: control
    icon.source: "image://svgmodifier/example.mixxx.org/imports/LateNight/assets/icons/intro_start.svg?#000000/" + (control.checked ? "#000000" : "#908070")
}
