import QtQuick 1.1;import com.nokia.symbian 1.1;QueryDialog{titleText:qsTr("Skin selection");icon:"images/note_info.svg";message:qsTr("Use Delight widget skins?");acceptButtonText:qsTr("OK");rejectButtonText:qsTr("Cancel");onAccepted:Helper.resolver("skins_delight.txt");Component.onCompleted:open();onStatusChanged:if(status===DialogStatus.Closing)destroy();}