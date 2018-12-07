import QtQuick 1.1;import com.nokia.symbian 1.1;
CommonDialog{
privateCloseIcon:true;titleText:qsTr("Modify ") + currentAutoStart
buttonTexts:["Enable","Remove","Cancel"]
content:Item{height:text.height+col.spacing*2+col.anchors.topMargin+col.anchors.bottomMargin;width:parent.width;
Column{id:col;spacing:platformStyle.paddingMedium;anchors{leftMargin:platformStyle.borderSizeMedium;rightMargin:platformStyle.borderSizeMedium;topMargin:platformStyle.borderSizeMedium;fill:parent;}
Label{id:text;anchors.left:parent.left;anchors.right:parent.right;horizontalAlignment:Text.AlignHCenter;text:qsTr("Enable/Remove ") + currentAutoStart + qsTr("'s disabled autostart?");wrapMode:Text.WordWrap;}}}
onStatusChanged:if(status===DialogStatus.Closing)destroy();
Component.onCompleted:open()
onButtonClicked:{
switch(index)
{
case 0:
Helper.enableAutostart(currentAutoStart)
break
case 1:
Helper.removeDisabledAutostart(currentAutoStart)
break}
close()}}
