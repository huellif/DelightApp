import QtQuick 1.1;import com.nokia.symbian 1.1;Page{tools:ToolBarLayout{ToolButtonWithTip{iconSource:"toolbar-back";onClicked:pageStack.pop();toolTipText:qsTr("Back");}}Flickable{id:f;anchors.fill:parent;contentHeight:o.height;flickableDirection:Flickable.VerticalFlick;Item{id:o;height:lbl.height+head.height+img1.height+rec1.height+img2.height+rec2.height+img3.height+rec3.height+img4.height+knopf.height;ListHeading{id:head;ListItemText{anchors.centerIn:parent;role:"Heading";text:qsTr("Choose your keyboard skin");}}Label{id:lbl;anchors.top:head.bottom;text:qsTr("\nTouch on a picture to apply a new keyboard skin.");anchors.right:rec1.right;anchors.left:rec1.left;horizontalAlignment:Text.AlignHCenter;wrapMode:Text.WordWrap;font.pointSize:20;}Image{id:img1;width:360;height:309;anchors.horizontalCenter:rec1.horizontalCenter;anchors.top:lbl.bottom;sourceSize.width:360;sourceSize.height:309;source:"file:///Z:/Private/e11274ff/keyboard/Delight.jpg";fillMode:Image.PreserveAspectFit;asynchronous:true;MouseArea{anchors.fill:parent;onClicked:create("Selector_keyboard_Delight.qml");}}Rectangle{id:rec1;width:f.width;height:5;anchors.top:img1.bottom;}Image{id:img2;width:360;height:309;anchors.horizontalCenter:rec1.horizontalCenter;anchors.top:rec1.bottom;sourceSize.width:360;sourceSize.height:309;source:"file:///Z:/Private/e11274ff/keyboard/Blue.jpg";fillMode:Image.PreserveAspectFit;asynchronous:true;MouseArea{anchors.fill:parent;onClicked:create("Selector_keyboard_blue.qml");}}Rectangle{id:rec2;width:f.width;height:5;color:"#ffffff";anchors.top:img2.bottom;}Image{id:img3;width:360;height:309;anchors.horizontalCenter:rec2.horizontalCenter;anchors.top:rec2.bottom;sourceSize.width:360;sourceSize.height:309;source:"file:///Z:/Private/e11274ff/keyboard/original.jpg";fillMode:Image.PreserveAspectFit;asynchronous:true;MouseArea{anchors.fill:parent;onClicked:create("Selector_keyboard_FP2.qml");}}Rectangle{id:rec3;width:f.width;height:5;color:"#ffffff";anchors.top:img3.bottom;}Image{id:img4;width:360;height:309;anchors.horizontalCenter:rec2.horizontalCenter;anchors.top:rec3.bottom;sourceSize.width:360;sourceSize.height:309;source:"file:///Z:/Private/e11274ff/keyboard/black.jpg";fillMode:Image.PreserveAspectFit;asynchronous:true;MouseArea{anchors.fill:parent;onClicked:create("Selector_keyboard_black.qml");}}Button{id:knopf;anchors.top:img4.bottom;text:qsTr("Load another keyboard");width:f.width;anchors.horizontalCenter:rec2.horizontalCenter;onClicked:Helper.keyboard();}}Decorator{flickableItem:f;}}}