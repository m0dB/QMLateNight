import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Window {
    id: root

    width: 1366
    minimumWidth: deckMixerRow.implicitWidth
    minimumHeight: deckMixerRow.implicitHeight
    height: 480
    visible: true
    color: "#000000"

    ColumnLayout {
        spacing: 0
        width: parent.width
        height: parent.height
        Item {
            Layout.fillHeight: true
        }
        RowLayout {
            id: deckMixerRow
            spacing: 2
            Layout.fillHeight: false
            Layout.minimumWidth: implicitWidth
            // Dect left + PitchRate left
            RowLayout {
                spacing: 0
                Deck {
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                }
                PitchRate {
                    Layout.fillHeight: true
                }
            }
            // Mixer + HeadphoneMix + MainMix
            RowLayout {
                spacing: 0
                Layout.fillWidth: false
                Mixer {
                    Layout.fillHeight: true
                }
                Item {
                    Layout.fillHeight: true
                    width: childrenRect.width
                    MainMix {
                        height: parent.height / 2
                    }
                    HeadphoneMix {
                        y: parent.height / 2
                        height: parent.height / 2
                    }
                }
            }
            // Deck right + PitchRate right
            RowLayout {
                spacing: 0
                Layout.minimumWidth: implicitWidth
                Deck {
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                }
                PitchRate {
                    Layout.fillHeight: true
                }
            }
        }
        Row {
            id: header
            height: 20
            spacing: libraryTableView.columnSpacing
            Repeater {
                id: headerRepeater
                model: 3 //libraryTableView.model.columnCount
                Rectangle {
                    color: "#88A"
                    width: splitter.x + 6; height: 20

                    Label {
                        anchors.fill: parent
                        elide: Text.ElideMiddle
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        property var label: libraryTableView.model.headerData(index,Qt.Horizontal)
                        text: label !== undefined ? label + " (" + String.fromCharCode(65 + index) + ")" : String.fromCharCode(65 + index)
                    }
                    Item {
                        id: splitter
                        x: 94
                        width: 12
                        height: parent.height + 10
                        DragHandler {
                            yAxis.enabled: false
                            onActiveChanged: if (!active) libraryTableView.forceLayout()
                        }
                    }
                }
            }
        }
        TableView {
            id: libraryTableView
            Layout.fillWidth: true
            Layout.fillHeight: true
            model: libraryTableModel
            columnWidthProvider: function(column) { return headerRepeater.itemAt(column).width }
            delegate: Rectangle {
                implicitWidth: childrenRect.height
                implicitHeight: childrenRect.height

                color: "black"
                Text {
                    color: "white"
                    text: display
                }
            }
        }
    }
}
