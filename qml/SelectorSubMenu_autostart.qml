import QtQuick 1.1
import com.nokia.symbian 1.1

Page{
    id:autostartPage
    property string currentAutoStart
    tools:ToolBarLayout{
        ToolButtonWithTip{iconSource:"toolbar-back";onClicked:pageStack.pop();toolTipText:qsTr("Back");}
        ToolButtonWithTip{iconSource:"toolbar-add";onClicked:create("Selector_addAutostart.qml");toolTipText:qsTr("Add new");}
        ToolButtonWithTip{iconSource:"toolbar-refresh";onClicked:refresh();toolTipText:qsTr("Refresh");}
        ToolButtonWithTip{iconSource:"toolbar-menu";onClicked:dlg.create("SelectorSubMenu_autostart_menu.qml");toolTipText:qsTr("Menu");}
    }
    Connections{
        target: watcher;
        onFileChanged: {
            refresh();
            if(path == "C:\\private\\100012a5\\DBS_2000836D_DBS_DSC.db") {
                watcher.addPathFromQtQuick();
            }
        }
    }
    Flickable{id:f;anchors.fill:parent;contentHeight:o.height;flickableDirection:Flickable.VerticalFlick;
        Column{id:o;
            ListHeading{ListItemText{anchors.centerIn:parent;role:"Heading";text:qsTr("Active autostart items");}}
            Repeater {
                id:rp1
                ListItem{onClicked:{currentAutoStart=modelData;dlg.create("Selector_removeAutostart.qml")}ListItemText{role:"Title";text:modelData;anchors.verticalCenter:parent.verticalCenter;}}
            }
            ListHeading{ListItemText{anchors.centerIn:parent;role:"Heading";text:qsTr("Disabled autostart items");}}
            Repeater {
                id:rp2
                ListItem{onClicked:{currentAutoStart=modelData;dlg.create("Selector_actionDisabledAutostart.qml")}ListItemText{role:"Title";text:modelData;anchors.verticalCenter:parent.verticalCenter;}}
            }
        }
        Decorator{flickableItem:f;}
    }
    function refresh() {
        rp1.model = Helper.getAutostart();
        rp2.model = Helper.getInactiveAutostart(rp1.model);
    }

    Component.onCompleted: refresh();
    QtObject{
        id:dlg;
        property Component c:null;
        function create(q){c=Qt.createComponent(q);c.createObject(autostartPage);}
    }
}
