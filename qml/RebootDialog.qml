import QtQuick 1.1;import com.nokia.symbian 1.1;QueryDialog{titleText:qsTr("Reboot dialogue");privateCloseIcon:true;message:qsTr("<p><center>Do really want to reboot your phone?</p>");acceptButtonText:qsTr("Reboot");rejectButtonText:qsTr("Cancel");onAccepted:Helper.run(4);Component.onCompleted:open();onStatusChanged:if(status===DialogStatus.Closing)destroy();}