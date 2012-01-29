import QtQuick 1.1
import com.nokia.meego 1.0

Page {
    tools: commonTools

    GamesModel {
        id: model
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
}
