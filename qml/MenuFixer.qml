import QtQuick 1.1;import com.nokia.symbian 1.1;QueryDialog{titleText:qsTr("Menu Fixer");icon:"images/note_info.svg";message:qsTr("Problem with Menu (Icons missing/incorrect)?\nMenu Layout will be gone and phone will be restarted.\n\nContinue?");acceptButtonText:qsTr("Fix");rejectButtonText:qsTr("Cancel");onAccepted:{Helper.resolver("Menu.txt");destroy();}onRejected:destroy();Component.onCompleted:open();}