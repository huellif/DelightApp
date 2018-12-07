import QtQuick 1.1;import com.nokia.symbian 1.1
QueryDialog{
privateCloseIcon:true
titleText:qsTr("Exit")
content:Text{anchors{top:parent.top;left:parent.left;right:parent.right;margins:platformStyle.paddingMedium}color:"#ffffff"
text:"<center>"+qsTr("Do you want to exit Delight App?")+"</center>";wrapMode:Text.Wrap}acceptButtonText:qsTr("Exit")
rejectButtonText:qsTr("Cancel")
onAccepted:Qt.quit()
Component.onCompleted:open()
onStatusChanged:if(status===DialogStatus.Closing)destroy()}
