import QtQuick 1.1;import com.nokia.symbian 1.1;Page{QueryDialog{privateCloseIcon:true;titleText:qsTr("Tactile feedback");message:qsTr("Do you want to disable / enable a short vibration when you are dialling or disconnecting your call?\n\nBy default it is enabled in Delight.");acceptButtonText:qsTr("Enable");rejectButtonText:qsTr("Disable");onButtonClicked:{if(index==0)Helper.resolver("Tactile_on.txt");else Helper.resolver("Tactile_off.txt");}onStatusChanged:if(status===DialogStatus.Closing)destroy();Component.onCompleted:open();}}