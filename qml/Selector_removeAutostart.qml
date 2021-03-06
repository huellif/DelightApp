import QtQuick 1.1;import com.nokia.symbian 1.1;
CommonDialog{
privateCloseIcon:true;titleText:qsTr("Modify ") + currentAutoStart;
buttonTexts:["Remove","Disable","Cancel"]
content:Item{height:text.height+col.spacing*2+col.anchors.topMargin+col.anchors.bottomMargin;width:parent.width;
Column{id:col;spacing:platformStyle.paddingMedium;anchors{leftMargin:platformStyle.borderSizeMedium;rightMargin:platformStyle.borderSizeMedium;topMargin:platformStyle.borderSizeMedium;fill:parent;}
Label{id:text;anchors.left:parent.left;anchors.right:parent.right;horizontalAlignment:Text.AlignHCenter;text:qsTr("Remove/Disable ") + currentAutoStart + qsTr(" from autostart?");wrapMode:Text.WordWrap;}}}
onStatusChanged:if(status===DialogStatus.Closing)destroy();
Component.onCompleted:open()
onButtonClicked:{
switch(index)
{
case 0:
Helper.removeAutostart(currentAutoStart)
break
case 1:
Helper.disableAutostart(currentAutoStart)
break}
close()}}
