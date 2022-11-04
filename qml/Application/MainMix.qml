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
            // Main
            ColumnLayout {
                spacing: 0
                Dial {
                    color: "#c06020"
                }
                Label {
                    text: "MAIN"
                    Layout.alignment: Qt.AlignHCenter
                    font.pixelSize: 10
                }
            }
            // Balance
            ColumnLayout {
                spacing: 0
                Dial {
                    color: "#a00000"
                    from: -1
                    to: 1
                }
                Label {
                    text: "BAL"
                    Layout.alignment: Qt.AlignHCenter
                    font.pixelSize: 10
                }
            }
        }
        FxButtonRow {
            Layout.alignment: Qt.AlignHCenter
        }
    }
}
