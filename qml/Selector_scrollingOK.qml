import QtQuick 1.1;import com.nokia.symbian 1.1;Page{QueryDialog{titleText:qsTr("Scrolling changes");icon:"images/note_info.svg";message:qsTr("Apply all changes?\nThis will work on the fly.");acceptButtonText:qsTr("Apply");rejectButtonText:qsTr("Cancel");onAccepted:{Helper.setInt("0x1",id1.value);Helper.setInt("0x2",id2.value);Helper.setInt("0x4",id4.value);Helper.setInt("0x5",id5.value);Helper.setInt("0x6",id6.value);Helper.setInt("0x7",id7.value);Helper.setInt("0x8",id8.value);Helper.setInt("0x9",id9.value);Helper.setInt("0xB",idB.value);Helper.setInt("0x10",id10.value);Helper.setInt("0x11",id11.value);Helper.setInt("0x12",id12.value);Helper.success();}onStatusChanged:if(status===DialogStatus.Closing)destroy();Component.onCompleted:open();}}