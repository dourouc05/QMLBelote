import QtQuick 1.1
import com.nokia.meego 1.0
import "functions.js" as Belote

Rectangle {
    id: container
    color: "#343434"

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

    Component {
        id: listDelegate

        Item {
            id: delegateItem
            width: listView.width
            height: 50
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

    ListView {
        id: listView
        model: model
        delegate: listDelegate

        anchors {
            fill: parent
            margins: 20
        }

        header {
            Row {
                spacing: 15

                Column {
                    id: colN

                    Text {
                        text: "Number"
                    }
                }

                Column {
                    id: colA

                    Text {
                        text: "Team A"
                    }
                }

                Column {
                    id: colB

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
                    id: colS
                    width: 97

                    Text {
                        text: " "
                    }
                }

                Column {
                    id: colSA
                    width: 15

                    Text {
                        text: model.sumA
                    }
                }

                Column {
                    id: colSB
                    width: 15

                    Text {
                        text: model.sumB
                    }
                }
            }
        }
    }

    Rectangle {
        id: error
        visible: false
        anchors {
            verticalCenter: parent.verticalCenter
            horizontalCenter: parent.horizontalCenter
        }

        Text {
            id: errorText
            text: "Error"
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

        // The MeeGo counterpart of TextInput: it just looks native!
        // http://harmattan-dev.nokia.com/docs/library/html/qt-components/qt-components-meego-textfield.html
        TextField {
            id: tA
            placeholderText: "Team A"
            maximumLength: 2
            width: 120

            // 50 is supposed to be large enough (let's say 16 points from
            // the whole game, plus 20 for a carré of jacks, plus a belote
            // (2), plus a carré of nines (10), that makes 48!)
            validator: IntValidator {bottom: 0; top: 50;}

            anchors {
                left: parent.left
                margins: 20
            }
        }

        TextField {
            id: tB
            placeholderText: "Team B"
            maximumLength: 2
            width: 120

            validator: IntValidator {bottom: 0; top: 50;}

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
