import QtQuick 1.1
import com.nokia.meego 1.0
import "Belote.js" as Belote

Page {
    tools: commonTools

    ListModel {
        id: model

        property int sumA: 0
        property int sumB: 0
    }

    Component.onCompleted: Belote.fillModel(model)

    Component {
        id: listDelegate

        Item {
            id: delegateItem
            width: listView.width
            height: 55

            Row {
                anchors.verticalCenter: parent.verticalCenter
                spacing: 110

                Column {
                    Text {
                        text: qsTr("Game %1").arg(number)
                        color: "grey"
                        width: 120
                    }
                }

                Column {
                    Text {
                        text: teamA
                        color: "white"
                    }
                }

                Column {
                    Text {
                        text: teamB
                        color: "white"
                    }
                }
            }
        }
    }

    ListView {
        id: listView
        model: model
        delegate: listDelegate
        anchors.fill: parent

        header {
            Row {
                spacing: 20

                Column {
                    Text { text: qsTr("Number") }
                }

                Column {
                    Text { text: qsTr("Team A") }
                }

                Column {
                    Text { text: qsTr("Team B") }
                }
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

                    Text { text: model.sumA }
                }

                Column {
                    width: 15

                    Text { text: model.sumB }
                }
            }
        }
    }
}
