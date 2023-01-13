import QtQuick 2.15
import Counter 1. 0
import "EggsCreation.js" as MyScript

Placeholder {
    id: _notify
    property alias displayCount: _display.g_count
    property alias displayCount_2: _display_2.g_count
    property alias fontPixelSize: _display.font.pixelSize
    property alias displayText: _display.baseText
    property Egg target: null
    signal send()
    onTargetChanged: send.connect(target.receive)
    Text {
        id: _name
        x: 0 //93
        y: 0 //92
        color: "#ffffff"
        property string baseText: "Your eggs"
        property int g_count: 0
        text: qsTr(baseText)
        font.bold: true
        font.family: "Gill Sans"
        fontSizeMode: Text.FixedSize
        font.pixelSize: fontPixelSize
        font.italic: true
        anchors.horizontalCenter: parent.horizontalCenter

    }


    Text {
        id: _display
        x: 0 //93
        y: 0 //92
        color: "#ffffff"
        property string baseText: ""
        property int g_count: 0
        text: qsTr(baseText) + ((g_count === 0) ? "" : g_count)
        font.bold: true
        font.family: "Gill Sans"
        fontSizeMode: Text.FixedSize
        font.pixelSize: 30
        font.italic: true
        anchors.top: _name.bottom
        anchors.horizontalCenter: parent.horizontalCenter
    }

    //"your passive income"
    Text {
        id: _name_2
        x: 0 //93
        y: 0 //92
        color: "#78BD40"
        property string baseText: "your passive income"
        property int g_count: 0
        text: qsTr(baseText)
        font.bold: true
        font.family: "Gill Sans"
        fontSizeMode: Text.FixedSize
        font.pixelSize: fontPixelSize * 0.5
        font.italic: true
        anchors.top: _display.bottom
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Text {
        id: _display_2
        x: 0 //93
        y: 0 //92
        color: "#78BD40"
        property string baseText: ""
        property int g_count: 0
        text: qsTr(baseText) + ((g_count === 0) ? "" : g_count + " per sec.")
        font.bold: true
        font.family: "Gill Sans"
        fontSizeMode: Text.FixedSize
        font.pixelSize: fontPixelSize * 0.5
        font.italic: true
        anchors.top: _name_2.bottom
        anchors.horizontalCenter: parent.horizontalCenter
    }

    function receive(value){
        displayCount += value
        MyScript.createEgg()
       // send()
    }

    function receive_2(value){
        displayCount_2 += value

    }
}
