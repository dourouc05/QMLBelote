import QtQuick 1.1
import com.nokia.meego 1.0

Page {
    tools: ToolBarLayout {
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
                onClicked: {
                    commonModel.clear();
                    commonModel.sumA = 0;
                    commonModel.sumB = 0;
                }
            }
        }
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
