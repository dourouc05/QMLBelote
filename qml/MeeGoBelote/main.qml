import QtQuick 1.1
import com.nokia.meego 1.0
import "functions.js" as Belote

Rectangle {
    id: container
    color: "#343434"

    // The model:
    ListModel {
        id: model

        property int sumA: 0
        property int sumB: 0

        ListElement {
            number: 1
            teamA: 0
            teamB: 0
        }

        ListElement {
            number: 2
            teamA: 0
            teamB: 0
        }
    }

    // The delegate for each fruit in the model:
    Component {
        id: listDelegate

        Item {
            id: delegateItem
            width: listView.width; height: 50
            clip: true

            Row {
                spacing: 110

                Column {
                    Text {
                        text: "Play " + number
                        color: "grey"
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

    // The view:
    ListView {
        id: listView
        anchors.fill: parent; anchors.margins: 20
        model: model
        delegate: listDelegate
        header {
            Row {
                spacing: 15

                Column {
                    Text {
                        text: "Number"
                    }
                }

                Column {
                    Text {
                        text: "Team A"
                    }
                }

                Column {
                    Text {
                        text: "Team B"
                    }
                }
            }
        }
        footer {
            Row {
                spacing: 120

                Column {
                    Text {
                        text: ""
                    }
                }

                Column {
                    Text {
                        text: model.sumA
                    }
                }

                Column {
                    Text {
                        text: model.sumB
                    }
                }
            }
        }
    }

    Row {
        id: add
        visible: false
        spacing: 30
        anchors {
            left: parent.left
            bottom: parent.bottom
            margins: 10
        }

        TextInput {
            id: tA
            text: "Team A"

            anchors {
                left: parent.left
                margins: 20
            }
        }

        TextInput {
            id: tB
            text: "Team B"

            anchors {
                left: parent.left
                margins: 170
            }
        }

        TextButton {
            text: "Add"
            onClicked: Belote.onAdded(add, btns, tA, tB)

            anchors {
                left: parent.left
                margins: 350
            }
        }
    }

    Row {
        id: btns
        spacing: 30
        anchors {
            left: parent.left
            bottom: add.bottom
            margins: 10
        }

        TextButton {
            text: "Remove all"
            onClicked: Belote.onClear()
        }

        TextButton {
            text: "Add"
            onClicked: Belote.onAdd(add, btns)
        }
    }
}
