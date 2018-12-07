import QtQuick 1.1;import com.nokia.symbian 1.1;
Page{tools:ToolBarLayout{ToolButtonWithTip{iconSource:"toolbar-back";onClicked:pageStack.pop();toolTipText:qsTr("Back");}}
    Flickable{anchors.fill:parent;contentHeight:o.height;flickableDirection:Flickable.VerticalFlick;
        Column{id:o;
            ListHeading{ListItemText{anchors.centerIn:parent;role:"Heading";text:"Tools";}}
            ListItem{onClicked:pageStack.push("qrc:/qml/SelectorSubMenu_autostart.qml");ListItemText{role:"Title";text:qsTr("Autostart editor");anchors.verticalCenter:parent.verticalCenter;}}
            ListItem{onClicked:pageStack.push("qrc:/qml/contest.qml");ListItemText{role:"Title";text:qsTr("Connectivity test editor");anchors.verticalCenter:parent.verticalCenter;}}
            ListItem{onClicked:create("SelectorSubMenu_debug.qml");ListItemText{role:"Title";text:qsTr("Debug mode");anchors.verticalCenter:parent.verticalCenter;}}
            ListItem{onClicked:create("SelectorSubMenu_hash.qml");ListItemText{role:"Title";text:qsTr("Hash calculator");anchors.verticalCenter:parent.verticalCenter;}}
            ListItem{onClicked:create("LangCleanDialog.qml");ListItemText{role:"Title";text:qsTr("Language and Garbage Cleaner");anchors.verticalCenter:parent.verticalCenter;}}
            ListItem{onClicked:create("LangChangerDialog.qml");ListItemText{role:"Title";text:qsTr("Language Changer");anchors.verticalCenter:parent.verticalCenter;}}
            ListItem{onClicked:create("RegDialog.qml");ListItemText{role:"Title";text:qsTr("Registry Backup/Restore");anchors.verticalCenter:parent.verticalCenter;}}
            ListItem{onClicked:create("StartupReason.qml");ListItemText{role:"Title";text:qsTr("Startup Reason");anchors.verticalCenter:parent.verticalCenter;}}

        }
    }
}
