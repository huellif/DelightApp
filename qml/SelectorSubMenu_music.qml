import QtQuick 1.1
import com.nokia.symbian 1.1

Page{
    id:autostartPage
    tools:ToolBarLayout{
        ToolButtonWithTip{iconSource:"toolbar-back";onClicked:pageStack.pop();toolTipText:qsTr("Back");}
		ToolButtonWithTip{text:qsTr("Reset");onClicked:if(Helper.reset("0x101FFCD2","0x1"))pageStack.replace("qrc:/qml/SelectorSubMenu_music.qml");toolTipText:qsTr("Reset");}
        ToolButtonWithTip{iconSource:"toolbar-add";onClicked:if(Helper.addMusicLibrary())pageStack.replace("qrc:/qml/SelectorSubMenu_music.qml");toolTipText:qsTr("Add new");}
	}
    Flickable{id:f;anchors.fill:parent;contentHeight:o.height;flickableDirection:Flickable.VerticalFlick;
        Column{id:o;
            ListHeading{ListItemText{anchors.centerIn:parent;role:"Heading";text:qsTr("Music library folders");}}
            Repeater {
                id:rp1
                model: Helper.getMusicLibrary();
                ListItem{onClicked:if(Helper.removeMusicLibrary(modelData))pageStack.replace("qrc:/qml/SelectorSubMenu_music.qml");ListItemText{role:"Title";text:modelData;anchors.verticalCenter:parent.verticalCenter;}}
            }
        }
        Decorator{flickableItem:f;}
    }
    QtObject{
        id:dlg;
        property Component c:null;
        function create(q){c=Qt.createComponent(q);c.createObject(autostartPage);}
    }
}
