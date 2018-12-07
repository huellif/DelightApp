import QtQuick 1.1;
import com.nokia.symbian 1.1;
Page {
    tools: ToolBarLayout {
        ToolButtonWithTip {
            iconSource: "toolbar-back";onClicked: pageStack.pop();toolTipText: qsTr("Back");
        }
    }
    Flickable {
        anchors.fill: parent;
        contentHeight: o.height;
        flickableDirection: Flickable.VerticalFlick;
        Column {
            id: o;ListHeading {
                ListItemText {
                    anchors.centerIn: parent;
                    role: "Heading";
                    text: "Selector";
                }
            }
            ListItem {
                    visible: Helper.isFP2();
                    onClicked: create("SelectorSubMenu_aknspasrv.qml");subItemIndicator: true;ListItemText {
                    role: "Title";text: qsTr("Aknspasrv");anchors.verticalCenter: parent.verticalCenter;
                }
            }
            ListItem {
                onClicked: create("SelectorSubMenu_caching.qml");subItemIndicator: true;ListItemText {
                    role: "Title";text: qsTr("Application caching config");anchors.verticalCenter: parent.verticalCenter;
                }
            }
            ListItem {
                onClicked: pageStack.push("qrc:/qml/SelectorSubMenu_autostart.qml");subItemIndicator: true;ListItemText {
                    role: "Title";text: qsTr("Autostart editor");anchors.verticalCenter: parent.verticalCenter;
                }
            }
            ListItem {
                onClicked: create("SelectorSubMenu_camera.qml");subItemIndicator: true;ListItemText {
                    role: "Title";text: qsTr("Camera counter");anchors.verticalCenter: parent.verticalCenter;
                }
            }
            ListItem {
                onClicked: create("SelectorSubMenu_debug.qml");subItemIndicator: true;ListItemText {
                    role: "Title";text: qsTr("Debug mode");anchors.verticalCenter: parent.verticalCenter;
                }
            }
            ListItem {
                onClicked: create("SelectorFMTX.qml");subItemIndicator: true;ListItemText {
                    role: "Title";text: qsTr("FM Transmitter RDS");anchors.verticalCenter: parent.verticalCenter;
                }
            }
            ListItem {
                onClicked: create("SelectorSubMenu_hash.qml");subItemIndicator: true;ListItemText {
                    role: "Title";text: qsTr("Hash calculator");anchors.verticalCenter: parent.verticalCenter;
                }
            }
            ListItem {
                onClicked: create("Selector_caption.qml");subItemIndicator: true;ListItemText {
                    role: "Title";text: qsTr("Homscreen shortcut captions");anchors.verticalCenter: parent.verticalCenter;
                }
            }
            ListItem {
                    visible: Helper.isFP2();
                    onClicked: pageStack.push("qrc:/qml/SelectorSubMenu_keyboard.qml");subItemIndicator: true;ListItemText {
                    role: "Title";text: qsTr("Keyboard skin");anchors.verticalCenter: parent.verticalCenter;
                }
            }
            ListItem {
                visible: Helper.is808();
                subItemIndicator: true;onClicked: create("SelectorSubMenu_Keylock.qml");ListItemText {
                    role: "Title";text: qsTr("Keylock vibration");anchors.verticalCenter: parent.verticalCenter;
                }
            }
            ListItem {
                subItemIndicator: true;onClicked: create("Selector_SubMenuKeylight.qml");ListItemText {
                    role: "Title";text: qsTr("Keylight");anchors.verticalCenter: parent.verticalCenter;
                }
            }
            ListItem {
                subItemIndicator: true;onClicked: pageStack.push("qrc:/qml/Selector_light.qml");ListItemText {
                    role: "Title";text: qsTr("Light settings");anchors.verticalCenter: parent.verticalCenter;
                }
            }
            ListItem {
                onClicked: create("SelectorSubMenu_layout.qml");subItemIndicator: true;ListItemText {
                    role: "Title";text: qsTr("Menu icon layout");anchors.verticalCenter: parent.verticalCenter;
                }
            }
            ListItem {
                onClicked: create("SelectorSubMenu_MenuSkin.qml");subItemIndicator: true;ListItemText {
                    role: "Title";text: qsTr("Menu folders");anchors.verticalCenter: parent.verticalCenter;
                }
            }
            ListItem {
                subItemIndicator: true;onClicked: create("SelectorSubMenu_fader.qml");ListItemText {
                    role: "Title";text: qsTr("Popupfader");anchors.verticalCenter: parent.verticalCenter;
                }
            }
            ListItem {
                subItemIndicator: true;onClicked: create("SelectorSubMenu_iso.qml");ListItemText {
                    role: "Title";text: qsTr("Phone as modem/mount an .iso");anchors.verticalCenter: parent.verticalCenter;
                }
            }
            ListItem {
                subItemIndicator: true;onClicked: pageStack.push("qrc:/qml/Selector_scrolling.qml");ListItemText {
                    role: "Title";text: qsTr("Scrolling speed");anchors.verticalCenter: parent.verticalCenter;
                }
            }
            ListItem {
                subItemIndicator: true;onClicked: create("SelectorSubMenu_Customization.qml");ListItemText {
                    role: "Title";text: qsTr("Startup/Shutdown customization");anchors.verticalCenter: parent.verticalCenter;
                }
            }
            ListItem {
                subItemIndicator: true;onClicked: create("SelectorSubMenu_tactile.qml");ListItemText {
                    role: "Title";text: qsTr("Tactile feedback in calls");anchors.verticalCenter: parent.verticalCenter;
                }
            }
            ListItem {
                onClicked: create("SelectorSubMenu_widgets.qml");subItemIndicator: true;ListItemText {
                    role: "Title";text: qsTr("Widget skins");anchors.verticalCenter: parent.verticalCenter;
                }
            }
        }
    }
}
