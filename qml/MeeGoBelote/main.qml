import QtQuick 1.1
import com.nokia.meego 1.0
import "Belote.js" as Belote

PageStackWindow {
    id: appWindow

    ListModel {
        id: commonModel

        property int sumA: 0
        property int sumB: 0
    }

    Component.onCompleted: Belote.fillModel()
}
