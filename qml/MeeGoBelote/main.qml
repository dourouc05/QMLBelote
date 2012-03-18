import QtQuick 1.1
import com.nokia.meego 1.0
import "Belote.js" as Belote

PageStackWindow {
    id: appWindow

    QueryDialog {
        id: commonQueryDialog
        acceptButtonText: "Reset scores"
        rejectButtonText: "Go on"
        onAccepted: Belote.emptyModel()
        onRejected: commonModel.goOn = true
    }

    initialPage: MainPage {}

    AddGamePage {
        id: addGame
    }

    ListModel {
        id: commonModel

        property int sumA: 0
        property int sumB: 0
        property bool goOn: false
    }

    Component.onCompleted: Belote.fillModel()
}
