import QtQuick 1.1;import com.nokia.symbian 1.1
QueryDialog{
titleText:qsTr("Chat Fixer")
icon:"images/note_info.svg"
message:qsTr("Problem with Chat icon?\n\nSome chat apps (like Lightbulb, WhatsApp, Nokia Chat) show a chat icon in the notification bar if you have unread messages.\n\nIf these apps get closed/crash it still could be enabled.\nDo you want to disable/remove it?")
acceptButtonText:qsTr("Fix")
rejectButtonText:qsTr("Cancel")
onAccepted:Helper.disableChatIcon()
onStatusChanged:if(status===DialogStatus.Closing)destroy();
Component.onCompleted:open()}
