import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

GridLayout {
    Layout.alignment: Qt.AlignTop
    rowSpacing: 0
    columnSpacing: 2
    columns: 2
    EqKillButton {
        band: "H"
        Layout.alignment: Qt.AlignVCenter
    }
    EqDial {
    }
    EqKillButton {
        band: "M"
        Layout.alignment: Qt.AlignVCenter
    }
    EqDial {
    }
    EqKillButton {
        band: "L"
        Layout.alignment: Qt.AlignVCenter
    }
    EqDial {
    }
    FxButton {
    }
    FxDial {
    }
}
