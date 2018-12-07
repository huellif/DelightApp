import QtQuick 1.1;import com.nokia.symbian 1.1;
CommonDialog{
    privateCloseIcon:true;
    titleText:qsTr("FM-Transmitter RDS");
    buttons:Item{width:parent.width;height:privateStyle.toolBarHeightLandscape+platformStyle.paddingSmall*2;
        Row{anchors.centerIn:parent;spacing:platformStyle.paddingMedium;
            ToolButton{text:qsTr("Apply");id:button;enabled:field.text!="";onClicked:c();}
            ToolButton{
                text:field.text.trim()=="" ? qsTr("Back") : qsTr("Clear");
                onClicked:if(field.text.trim()=="") {
                              close();
                          }
                          else {
                              field.text = "";
                          }
            }}}
    content:Item{id:root;height:field.height+text.height+col.spacing*2+col.anchors.topMargin+col.anchors.bottomMargin;width:parent.width;
        Column{id:col;spacing:platformStyle.paddingMedium;anchors{leftMargin:platformStyle.borderSizeMedium;rightMargin:platformStyle.borderSizeMedium;topMargin:platformStyle.borderSizeMedium;fill:parent;}
            Label{id:text;anchors.left:parent.left;anchors.right:parent.right;text:qsTr("Set a new FM-Transmitter RDS text.\nThe maximum size is 8 letters.");wrapMode:Text.WordWrap;}
            TextField{id:field;Keys.onEnterPressed:{if(button.enabled)c();}anchors.left:parent.left;anchors.right:parent.right;onTextChanged:if(field.text.length>8)field.text=field.text.trim().substring(0,8).trim();onActiveFocusChanged:b();}}
        onWidthChanged:b();}
    onStatusChanged:if(status===DialogStatus.Closing)destroy();
    Component.onCompleted:{open();var a=Helper.getFMTX();if(a=="missingFMTX!"){button.enabled=false;field.enabled=false;field.placeholderText=qsTr("This device has no FM Transmitter!");}else {field.text=a;field.forceActiveFocus();field.openSoftwareInputPanel()}}
    function c(){field.text=field.text.trim();Helper.setFMTX(field.text);}
    function b(){var a=screen.width==640?true:false;if(a&&field.activeFocus)text.visible=false;else text.visible=true;}
}
