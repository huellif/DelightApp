import QtQuick 1.1;import com.nokia.symbian 1.1;Page{QueryDialog{privateCloseIcon:true;titleText:qsTr("AdBlock");message:qsTr("This is a local DNS corrector for blocking ads, which functions analogically to its fellow Windows PC one.\n\nBy default it is enabled in Delight.");acceptButtonText:qsTr("Enable");rejectButtonText:qsTr("Disable");onButtonClicked:{if(index==0)Helper.resolver("AdBlock_on.txt");else Helper.resolver("AdBlock_off.txt");}onStatusChanged:if(status===DialogStatus.Closing)destroy();Component.onCompleted:open();}}