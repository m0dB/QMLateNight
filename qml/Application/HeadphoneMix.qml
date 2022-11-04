import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Frame {
    color: "#171717"
    padding: 2
    ColumnLayout {
        height: parent.height
        spacing: 2
        RowLayout {
            Layout.alignment: Qt.AlignHCenter
            // Headphones
            ColumnLayout {
                spacing: 0
                Dial {
                    color: "#c06020"
                }
                Label {
                    text: "HEAD"
                    Layout.alignment: Qt.AlignHCenter
                    font.pixelSize: 10
                }
            }
            // Mix
            ColumnLayout {
                spacing: 0
                Dial {
                    color: "#a00000"
                }
                Label {
                    text: "MIX"
                    Layout.alignment: Qt.AlignHCenter
                    font.pixelSize: 10
                }
            }
        }
        ToggleButton {
            text: "SPLIT"
            font.pixelSize: 12
            implicitHeight: 20
            Layout.alignment: Qt.AlignHCenter
        }
        FxButtonRow {
            Layout.alignment: Qt.AlignHCenter
        }
    }
}
