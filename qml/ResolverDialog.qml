import QtQuick 1.1;import com.nokia.symbian 1.1;QueryDialog{titleText:"Extras";icon:"images/note_info.svg";message:qsTr("Extras is an easy wizard to change multiple things.\n\nJust touch a few options and read the informations, you always can cancel before the scripts run.\nSome scripts need a restart.\n\nExtras is split into multiple sub-apps:\n-Classic Resolver, which helps to solve typical (Custom)Firmware problems\n\n-Language and Garbage Cleaner, which cleans what the title reads\n\n- My own MiniCMD, which provides options to launch MiniCMD scrips and the MiniCMD wiki\n\n-Selector, which let you choose between diffrent settings, e.g. orignal and delight skins, menu folders, 3*4 or 4*5 menu ...");acceptButtonText:qsTr("Back");onAccepted:destroy();Component.onCompleted:open();}