import QtQuick 1.1;import com.nokia.symbian 1.1;QueryDialog{titleText:qsTr("Recorder fixer");icon:"images/note_info.svg";message:qsTr("This module will restore Delight default parameters as well as reset recorder count.");acceptButtonText:qsTr("Fix");rejectButtonText:qsTr("Cancel");onAccepted:Helper.resolver("Recorder.txt");onStatusChanged:if(status===DialogStatus.Closing)destroy();Component.onCompleted:open();}