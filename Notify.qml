import QtQuick 2.15
import Counter 1. 0
import "EggsCreation.js" as MyScript

Placeholder {
    id: _notify
    property alias displayCount: _display.g_count
    property alias fontPixelSize: _display.font.pixelSize
    property Egg target: null
    signal send()
    onTargetChanged: send.connect(target.receive)

    Text {
        id: _display
        x: 0 //93
        y: 0 //92
        color: "#ffffff"
        property string baseText: "Your eggs\n"
        property int g_count: 0
        text: qsTr(baseText)+ " " + ((g_count === 0) ? "" : g_count)
        font.bold: true
        font.family: "Gill Sans"
        fontSizeMode: Text.FixedSize
        font.pixelSize: 30
        font.italic: true
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
    }


    function receive(value){
        displayCount += value
        MyScript.createEgg()
       // send()
    }
}
