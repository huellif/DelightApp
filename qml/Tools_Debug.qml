import QtQuick 1.1;import com.nokia.symbian 1.1;QueryDialog{privateCloseIcon:true;titleText:qsTr("Debug");message:qsTr("Symbian has a debug mode a.k.a extended panic code, this is intresting for developers or patch makers. It is related to C:\\resource\\Errd\\\n\nSome parts of this are working on the fly, some require a reboot.");acceptButtonText:qsTr("Enable");rejectButtonText:qsTr("Disable");onButtonClicked:{if(index==0)Helper.resolver("Debug_on.txt");else Helper.resolver("Debug_off.txt");}onStatusChanged:if(status===DialogStatus.Closing)destroy();Component.onCompleted:open();}