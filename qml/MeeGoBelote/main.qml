import QtQuick 1.1
import com.nokia.meego 1.0
import "functions.js" as Belote

Rectangle {
    id: container
    color: "#343434"
    width:  500
    height: 500

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

        ListElement {
            number: 3
            teamA: 0
            teamB: 0
        }

        ListElement {
            number: 4
            teamA: 0
            teamB: 0
        }

        ListElement {
            number: 5
            teamA: 0
            teamB: 0
        }

        ListElement {
            number: 6
            teamA: 0
            teamB: 0
        }

        ListElement {
            number: 7
            teamA: 0
            teamB: 0
        }

        ListElement {
            number: 8
            teamA: 0
            teamB: 0
        }

        ListElement {
            number: 9
            teamA: 0
            teamB: 0
        }

        ListElement {
            number: 10
            teamA: 0
            teamB: 0
        }

        ListElement {
            number: 11
            teamA: 0
            teamB: 0
        }

        ListElement {
            number: 12
            teamA: 0
            teamB: 0
        }

        ListElement {
            number: 13
            teamA: 0
            teamB: 0
        }

        ListElement {
            number: 14
            teamA: 0
            teamB: 0
        }
    }

    Component {
        id: listDelegate

        Item {
            id: delegateItem
            width: listView.width
            height: 55
            clip: true

            Row {
                anchors.verticalCenter: parent.verticalCenter
                spacing: 110

                Column {
                    Text {
                        text: "Game " + number
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
        clip: true
        interactive: true
        anchors.fill: parent
        anchors.margins: 20

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
                    width: 107

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
        height: 55
        width: parent.width
        color: "darkred"

        anchors.verticalCenter: parent.verticalCenter

        Text {
            id: errorText
            text: "Error"
            horizontalAlignment: Text.AlignHCenter
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
            onClicked: Belote.onAdded(tA, tB)

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
            onClicked: Belote.onAdd()
        }
    }
}
