import QtQuick 1.1
import com.nokia.meego 1.0
import "Belote.js" as Belote

Page {
    TextField {
        id: ta

        placeholderText: "Team A"
        maximumLength: 20
        errorHighlight: !acceptableInput
        validator: IntValidator{bottom: 0; top: 50;}
        inputMethodHints: Qt.ImhDigitsOnly

        anchors {
            verticalCenter: parent.verticalCenter
            horizontalCenter: parent.horizontalCenter
            bottomMargin: 5
        }
    }

    TextField {
        id: tb

        placeholderText: "Team B"
        maximumLength: 20
        errorHighlight: !acceptableInput
        validator: IntValidator{bottom: 0; top: 50;}
        inputMethodHints: Qt.ImhDigitsOnly

        anchors {
            horizontalCenter: parent.horizontalCenter
            topMargin: 75
            top: ta.top
        }
    }

    Button {
        anchors {
            horizontalCenter: parent.horizontalCenter
            topMargin: 75
            top: tb.top
        }

        text: qsTr("Add game!")
        onClicked: Belote.pushGame(ta, tb)
    }
}