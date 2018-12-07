import QtQuick 1.1;import com.nokia.symbian 1.1;
Page{
    QueryDialog{
        privateCloseIcon:true;
        titleText:qsTr("Keylight");
        message:qsTr("Do you want to disable or enable the green, white and red key LEDs of your phone?");
        acceptButtonText:qsTr("Enable");
        rejectButtonText:qsTr("Disable");
        onButtonClicked:{if(index==0)Helper.resolver("808_lightOn.txt");else Helper.resolver("808_lightOff.txt");}
        onStatusChanged:if(status===DialogStatus.Closing)destroy();
        Component.onCompleted:open();
    }
}
