import QtQuick 2.15
import QtQuick.Window 2.15
import QtGraphicalEffects 1.0
import Counter 1. 0

Placeholder {
    id: _root
    property alias displaySource: _snake.source
    property int main_counter: 0
    property int counter: 1
    property int mult: 0
    property Notify target: null
    property int selfPrice: 0
    property bool timeTrigger: false

    anchors.horizontalCenter: parent.horizontalCenter


    signal send(int value)
    onTargetChanged: send.connect(target.receive)


    Image {
        id: _snake
        anchors.fill: parent
        source: "/Images/snake.png"

        MouseArea{
            anchors.fill: parent

            onClicked: {
                if(0 == _root.selfPrice)
                {
                    _root.send(_root.counter)
                }
                else if(_root.main_counter >= _root.selfPrice)
                {
                    timeTrigger = true;
                    _root.send(-1 * selfPrice)
                    _root.mult += 1
                }
            }
        }
    }

    Text {
        id: _nums
        x: _root.width * 0.85
        y: _root.width * 0.2
        color: "#ffffff"
        property string baseText: ""
        property int g_count: 0
        text: qsTr(baseText) + (timeTrigger ? mult : "")
        font.bold: true
        font.family: "Gill Sans"
        fontSizeMode: Text.FixedSize
        font.pixelSize: 20
        font.italic: true

    }

    function rereceive(value){
        _root.gamersSum = value
    }

    Timer {
        interval: 1000
        running: timeTrigger
        repeat: timeTrigger
        onTriggered: _root.send(_root.counter * _root.mult)
    }
}
