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
        Item {
            Layout.fillHeight: true
        }
    }
}
