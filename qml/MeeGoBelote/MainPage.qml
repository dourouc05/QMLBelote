import QtQuick 1.1
import com.nokia.meego 1.0

Page {
    tools: commonTools

    GamesModel {
        id: model
    }

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
        anchors.fill: parent

        header {
            Row {
                spacing: 20

                Column {
                    Text { text: "Number"}
                }

                Column {
                    Text { text: "Team A" }
                }

                Column {
                    Text { text: "Team B" }
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
