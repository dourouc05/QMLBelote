import QtQuick 1.1
import com.nokia.meego 1.0
import "Belote.js" as Belote

Page {
    tools: ToolBarLayout {
        ToolIcon {
            platformIconId: "toolbar-delete"
            anchors.left: parent.left
            onClicked: Belote.emptyModel()
        }

        ToolIcon {
            platformIconId: "toolbar-add"
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: pageStack.push(addGame)
        }

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
                text: qsTr("Clear")
                onClicked: Belote.emptyModel()
            }

            MenuItem {
                text: qsTr("Add game")
                onClicked: pageStack.push(addGame)
            }
        }
    }

    AddGamePage {
        id: addGame
    }

    ListView {
        id: listView
        model: commonModel
        delegate: MainDelegate{}
        anchors.fill: parent

        header {
            Row {
                spacing: 20

                Text { text: qsTr("Number"); width: 160 }
                Text { text: qsTr("Team A") }
                Text { text: qsTr("Team B") }
            }
        }

        footer {
            Row {
                spacing: 120

                Text { text: " "; width: 107 }
                Text { text: commonModel.sumA; width: 15 }
                Text { text: commonModel.sumB; width: 15 }
            }
        }
    }
}
