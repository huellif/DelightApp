import QtQuick 1.1;import com.nokia.symbian 1.1;QueryDialog{titleText:qsTr("Maps server selection");icon:"images/note_info.svg";message:qsTr("Ovi | h1n.ru is the default server where you can download map of any country, this can be done by sending a request.\n\nTo learn more, please read about Delight exclusive online services.");acceptButtonText:"OK";rejectButtonText:qsTr("Cancel");onAccepted:Helper.resolver("MapServer_ovi.txt");Component.onCompleted:open();onStatusChanged:if(status===DialogStatus.Closing)destroy();}