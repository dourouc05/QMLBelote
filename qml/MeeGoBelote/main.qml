import QtQuick 1.1
import com.nokia.meego 1.0
import "Belote.js" as Belote

PageStackWindow {
    id: appWindow

    initialPage: MainPage {}

    ToolBarLayout {
        id: commonTools
        ToolIcon {
            platformIconId: "toolbar-view-menu"
            anchors.right: parent.right
            onClicked: (myMenu.status == DialogStatus.Closed) ? myMenu.open() : myMenu.close()
        }
    }

    Menu {
        id: myMenu
        visualParent: pageStack
        MenuLayout {
            MenuItem {
                text: qsTr("Empty")
                onClicked: Belote.emptyModel(initialPage.model)
            }
        }
    }
}
