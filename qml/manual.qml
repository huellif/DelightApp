import QtQuick 1.1;import com.nokia.symbian 1.1;
Page{
    tools:ToolBarLayout{ToolButtonWithTip{iconSource:"toolbar-back";onClicked:pageStack.pop();toolTipText:qsTr("Back");}}
    Flickable{anchors.fill:parent;contentHeight:o.height;flickableDirection:Flickable.VerticalFlick;
        Column{id:o;
            ListHeading{ListItemText{anchors.centerIn:parent;role:"Heading";text:qsTr("Extras");}}
            ListItem{subItemIndicator:true;onClicked:pageStack.push("qrc:/qml/classic.qml");ListItemText{role:"Title";text:qsTr("Classic Resolver");anchors.verticalCenter:parent.verticalCenter;}}
            ListItem{subItemIndicator:true;onClicked:pageStack.push("qrc:/qml/MiniCMD.qml");ListItemText{role:"Title";text:"My own MiniCMD";anchors.verticalCenter:parent.verticalCenter;}}
            ListItem{onClicked:create("RebootDialog.qml");ListItemText{role:"Title";text:qsTr("Reboot the phone");anchors.verticalCenter:parent.verticalCenter;}}
            ListItem{subItemIndicator:true;onClicked:pageStack.push("qrc:/qml/selector.qml");ListItemText{role:"Title";text:"Selector";anchors.verticalCenter:parent.verticalCenter;}}
            ListItem{subItemIndicator:true;onClicked:pageStack.push("qrc:/qml/tools.qml");ListItemText{role:"Title";text:"Tools";anchors.verticalCenter:parent.verticalCenter;}}
        }
    }
}
