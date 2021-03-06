import QtQuick 1.1
import com.nokia.symbian 1.1
CommonDialog{
privateCloseIcon:true
titleText:qsTr("Camera counter")
buttons:Item{width:parent.width
height:privateStyle.toolBarHeightLandscape+platformStyle.paddingSmall*2
Row{anchors.centerIn:parent
spacing:platformStyle.paddingMedium
ToolButton{text:qsTr("Apply")
id:button;
enabled:field.acceptableInput
onClicked:c()}ToolButton{text:qsTr("Back")
onClicked:close()}}}content:Item{id:root
height:field.height+text.height+col.spacing*2+col.anchors.topMargin+col.anchors.bottomMargin
width:parent.width
Column{id:col
spacing:platformStyle.paddingMedium;anchors{leftMargin:platformStyle.borderSizeMedium
rightMargin:platformStyle.borderSizeMedium;topMargin:platformStyle.borderSizeMedium;fill:parent
}Label{id:text;anchors.left:parent.left;anchors.right:parent.right
text:qsTr("Set a new camera counter value.\n(That's the increasing number which gets stored as image name in the default camera app)")
wrapMode:Text.WordWrap
}TextField{id:field
text:Helper.getCamCounter()
Keys.onEnterPressed:{if(button.enabled)c()}anchors.left:parent.left;anchors.right:parent.right;
onTextChanged:field.text=field.text.trim()
onActiveFocusChanged:b()
validator:IntValidator{bottom:1;top:999999}}}
onWidthChanged:b()}
onStatusChanged:if(status===DialogStatus.Closing)destroy()
Component.onCompleted:open()
function c(){field.text=field.text.trim();Helper.setCamCounter(parseInt(field.text));close()}
function b(){var a=screen.width==640?true:false;if(a&&field.activeFocus)text.visible=false;else text.visible=true;}}
