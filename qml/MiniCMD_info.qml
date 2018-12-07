import QtQuick 1.1;import com.nokia.symbian 1.1;QueryDialog{titleText:qsTr("About MiniCMD");icon:"images/note_info.svg";message:qsTr("MiniCMD is a little framework for Symbian, it can run .txt files like .cmd or .bat files on a Windows PC.\n\nOur Delight apps (Updater, Backup&Restore, empty UDA and some parts of this app) are based on it.\n\nTo test your own .txt, create a .txt via X-Plore, you have to save it as unicode.\n\nPress the commands button to see all MiniCMD commands.\n\nTo launch a .txt check the other options on this page.");acceptButtonText:qsTr("Back");rejectButtonText:qsTr("Commands");onRejected:pageStack.push("qrc:/qml/MiniCMD_html.qml");Component.onCompleted:open();onStatusChanged:if(status===DialogStatus.Closing)destroy();}