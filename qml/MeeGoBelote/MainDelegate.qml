import QtQuick 1.1

Item {
    id: listItem
    width: listView.width
    height: 55

    Row {
        anchors.verticalCenter: parent.verticalCenter
        spacing: 110

        Text {
            text: qsTr("Game %1").arg(number)
            color: "grey"
            width: 130
            font.pixelSize: 43
            font.family: "Nokia Pure Text"
        }

        Text {
            text: teamA
            color: "white"
            horizontalAlignment: Text.AlignRight
            width: 35
            font.pixelSize: 43
            font.family: "Nokia Pure Text"
        }

        Text {
            text: teamB
            color: "white"
            horizontalAlignment: Text.AlignRight
            width: 35
            font.pixelSize: 43
            font.family: "Nokia Pure Text"
        }
    }
}
