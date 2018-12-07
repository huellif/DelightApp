import QtQuick 1.1;import com.nokia.symbian 1.1;
QueryDialog{
titleText:qsTr("KPSStartupReason");
icon:"images/note_info.svg";
message:"Your phone started because of an "+Helper.getStartupReason()+".\n\n\nAll possible startup reasons:\n\nENormalStartup: Normal restart\n\nELanguageSwitchReset: A reset due to display language change\n\nENormalRFSReset: A reset due to restoring factory settings\n\nEDeepRFSReset: A reset due to restoring factory settings (deep reset)\n\nEFirmwareUpdate: A reset due to firmware update\n\nEUnknownReset: A reset due to an unknown error\n\nEOperatorSettingReset: A reset due to removing operator settings\n\nENetworkModeChangeReset: A reset due to network mode change\n\nESIMStatusChangeReset: A reset due to removing/inserting SIM card\n\nEDataRestoreReset: A reset after restoring backed-up data\n\nEFieldTestReset: A reset required by Field Test software";
acceptButtonText:qsTr("Back");
Component.onCompleted:open();
onStatusChanged:if(status===DialogStatus.Closing)destroy();}
