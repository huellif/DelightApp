import QtQuick 1.1;import com.nokia.symbian 1.1;Page{QueryDialog{titleText:qsTr("Browser fixer");icon:"images/note_info.svg";message:qsTr("Having troubles with Web browser?\n\nThis will restore Web browser settings.");acceptButtonText:qsTr("Fix");rejectButtonText:qsTr("Cancel");onAccepted:{Helper.reset("0x10008d39");Helper.success();}onStatusChanged:if(status===DialogStatus.Closing)destroy();Component.onCompleted:open();}}