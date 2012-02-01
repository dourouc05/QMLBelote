import QtQuick 1.1
import com.nokia.meego 1.0
import "Belote.js" as Belote

Page {
    tools: commonTools

    Component {
        id: listDelegate

        Item {
            id: delegateItem
            width: listView.width
            height: 55

            Row {
                anchors.verticalCenter: parent.verticalCenter
                spacing: 110

                Text {
                    text: qsTr("Game %1").arg(number)
                    color: "grey"
                    width: 120
                }

                Text {
                    text: teamA
                    color: "white"
                    horizontalAlignment: Text.AlignRight
                    width: 40
                }

                Text {
                    text: teamB
                    color: "white"
                    horizontalAlignment: Text.AlignRight
                    width: 40
                }
            }
        }
    }

    ListView {
        id: listView
        model: commonModel
        delegate: listDelegate
        anchors.fill: parent

        header {
            Row {
                spacing: 20

                Text { text: qsTr("Number"); width: 160 }
                Text { text: qsTr("Team A") }
                Text { text: qsTr("Team B") }
            }
        }

        footer {
            Row {
                spacing: 120

                Column {
                    width: 107

                    Text { text: " " }
                }

                Column {
                    width: 15

                    Text { text: commonModel.sumA }
                }

                Column {
                    width: 15

                    Text { text: commonModel.sumB }
                }
            }
        }
    }
}
