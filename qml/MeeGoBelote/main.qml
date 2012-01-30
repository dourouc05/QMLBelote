import QtQuick 1.1
import com.nokia.meego 1.0

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
                onClicked: {
                    mainPage.modelname.clear();
                    mainPage.modelname.sumA = 0;
                    mainPage.modelname.sumB = 0;
                }
            }
        }
    }
}
