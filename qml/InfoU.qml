import QtQuick 1.1;import com.nokia.symbian 1.1;QueryDialog{titleText:"Updater";icon:"images/note.svg";message:qsTr("This is Delight Updater app\n\nWith this app you can completly Update your CFW without a Refurbish.\nJust flash via Update Software + without UDA and run Updater.\n(Read flashing instructions on Delight Blog)\n\nYou won't lose any Apps or Settings with this.");acceptButtonText:qsTr("Back");onAccepted:destroy();Component.onCompleted:open();}