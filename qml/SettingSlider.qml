import QtQuick 1.1;import com.nokia.symbian 1.1;Item{property string text:"";property alias minimumValue:slider.minimumValue;property alias maximumValue:slider.maximumValue;property alias value:slider.value;implicitWidth:parent.width;height:label.height+slider.height+2*platformStyle.paddingMedium+slider.anchors.margins;Text{id:label;color:"#FFFFFF";anchors{top:parent.top;left:parent.left;right:parent.right;margins:platformStyle.paddingMedium;}text:parent.text+" "+slider.value;wrapMode:Text.WordWrap;}Slider{id:slider;anchors{left:sub.right;right:add.left;top:label.bottom;margins:platformStyle.paddingSmall;}valueIndicatorVisible:true;value:parent.value;stepSize:1;}Button{id:sub;text:"-";anchors.left:parent.left;anchors.verticalCenter:slider.verticalCenter;anchors.margins:platformStyle.paddingSmall;onClicked:parent.value--;enabled:parent.value!=parent.minimumValue;}Button{id:add;text:"+";anchors.right:parent.right;anchors.verticalCenter:slider.verticalCenter;anchors.margins:platformStyle.paddingSmall;onClicked:parent.value++;enabled:parent.value!=parent.maximumValue;}onValueChanged:slider.value=value;}