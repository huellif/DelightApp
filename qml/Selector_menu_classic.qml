import QtQuick 1.1;import com.nokia.symbian 1.1;QueryDialog{titleText:qsTr("Menu selection");icon:"images/note_info.svg";message:qsTr("Use default menu (no folders)?");acceptButtonText:qsTr("OK");rejectButtonText:qsTr("Cancel");onAccepted:Helper.resolver("menu_default.txt");Component.onCompleted:open();onStatusChanged:if(status===DialogStatus.Closing)destroy();}