import QtQuick 1.1;import com.nokia.symbian 1.1;QueryDialog{titleText:qsTr("Cache reset");icon:"images/note_info.svg";message:qsTr("Do you want to clear AknIconSrv cache?\n\nYou can reload all .mif files on the fly, no need of a reboot.");acceptButtonText:qsTr("Fix");rejectButtonText:qsTr("Cancel");onAccepted:{Helper.cache();Helper.success();}onStatusChanged:if(status===DialogStatus.Closing)destroy();Component.onCompleted:open();}