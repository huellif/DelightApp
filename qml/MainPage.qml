import QtQuick 1.1;import com.nokia.symbian 1.1;Page{id:mP;tools:ToolBarLayout{ToolButtonWithTip{iconSource:"images/close.svg";onClicked:Qt.quit();toolTipText:qsTr("Close");}ToolButtonWithTip{iconSource:"images/internet.svg";onClicked:Helper.b("http://ovi.h1n.ru");toolTipText:"Ovi | h1n.ru";}ToolButtonWithTip{iconSource:"toolbar-menu";onClicked:create("MainMenu.qml");toolTipText:qsTr("Menu");}}Flickable{anchors.fill:parent;contentHeight:c.height;flickableDirection:Flickable.VerticalFlick;Column{id:c;ListHeading{ListItemText{role:"Heading";text:qsTr("Delight Tools");anchors.horizontalCenter:parent.horizontalCenter;anchors.verticalCenter:parent.verticalCenter;}}ListItem{onClicked:pageStack.push("qrc:/qml/extras.qml");onPressAndHold:create("InfoExtras.qml");Image{id:i;anchors.leftMargin:5;anchors.verticalCenter:parent.verticalCenter;anchors.left:parent.left;source:"images/1.png";sourceSize.height:55;sourceSize.width:55;}ListItemText{role:"Title";text:qsTr("  Extras");anchors.verticalCenter:parent.verticalCenter;anchors.left:i.right;}}ListItem{onClicked:Helper.run(1);onPressAndHold:create("InfoUpdater.qml");Image{id:j;anchors{leftMargin:5;verticalCenter:parent.verticalCenter;left:parent.left;}source:"images/2.png";sourceSize.height:55;sourceSize.width:55;}ListItemText{role:"Title";text:qsTr("  Updater");anchors.left:j.right;anchors.verticalCenter:parent.verticalCenter;}}ListItem{onClicked:Helper.run(2);onPressAndHold:create("InfoBackupRestore.qml");Image{id:k;anchors{leftMargin:5;verticalCenter:parent.verticalCenter;left:parent.left;}source:"images/3.png";sourceSize.height:55;sourceSize.width:55;}ListItemText{role:"Title";text:qsTr("  Backup");anchors.verticalCenter:parent.verticalCenter;anchors.left:k.right;}}ListItem{onClicked:Helper.run(3);onPressAndHold:create("InfoBackupRestore.qml");Image{id:l;anchors{leftMargin:5;verticalCenter:parent.verticalCenter;left:parent.left;}source:"images/4.png";sourceSize.height:55;sourceSize.width:55;}ListItemText{role:"Title";text:qsTr("  Restore");anchors.verticalCenter:parent.verticalCenter;anchors.left:l.right;}}ListHeading{ListItemText{role:"Heading";text:qsTr("Other Stuff");anchors.horizontalCenter:parent.horizontalCenter;anchors.verticalCenter:parent.verticalCenter;}}ListItem{onClicked:create("FeaturesMenu.qml");onPressAndHold:create("InfoFeatures.qml");ListItemText{role:"Title";text:qsTr(" Delight Features");anchors.verticalCenter:parent.verticalCenter;}}ListItem{onClicked:pageStack.push("qrc:/qml/HTML.qml",{ur:"FAQ"});onPressAndHold:create("InfoFAQ.qml");ListItemText{role:"Title";text:" Delight FAQ";anchors.verticalCenter:parent.verticalCenter;}}Label{text:qsTr("\nHold an option for more information");font.pointSize:20;anchors.horizontalCenter:parent.horizontalCenter;}}}}