import QtQuick 1.1;import com.nokia.symbian 1.1;Page{QueryDialog{privateCloseIcon:true;titleText:qsTr("Popup fader");message:qsTr("Disable / enable the popup fader?\n\nThis is the black mask which overlays the UI after opening a popup or submenu. By default it is disabled in Delight.");acceptButtonText:qsTr("Enable");rejectButtonText:qsTr("Disable");onButtonClicked:{if(index==0)Helper.resolver("Fader_on.txt");else Helper.resolver("Fader_off.txt");}onStatusChanged:if(status===DialogStatus.Closing)destroy();Component.onCompleted:open();}}