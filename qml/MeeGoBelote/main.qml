import QtQuick 1.1
import com.nokia.meego 1.0

Rectangle {
    id: container
    color: "#343434"

    // The model:
    ListModel {
        id: model

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
    }

    Row {
        spacing: 30
        anchors {
            left: parent.left
            bottom: parent.bottom
            margins: 20
        }

        TextButton {
            text: "Remove all"
            onClicked: model.clear()
        }

        TextButton {
            text: "Add"
            onClicked: {
                model.append({
                                 "number": model.count + 1,
                                 "teamA": 2,
                                 "teamB": 3
                             })
            }
        }
    }
}
