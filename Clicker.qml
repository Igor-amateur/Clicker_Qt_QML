import QtQuick 2.15
import QtQuick.Window 2.15
import QtGraphicalEffects 1.0
import Counter 1. 0
import QtQml 2. 0

Placeholder {
    id: _root
    property alias displaySource: _snake.source
    property alias aLLmargins: _snake.aLLmargins
    property int main_counter: 0
    property int counter: 1
    property int amplify: 0
    property int mult: 0
    property Notify target: null
    property int selfPrice: 0
    property bool timeTrigger: false

    anchors.horizontalCenter: parent.horizontalCenter


    signal send(int value)
    onTargetChanged: send.connect(target.receive)

    Image {
        id: _snake
        property int aLLmargins: 0
        anchors.fill: parent
        anchors.margins: aLLmargins
        source: "/Images/snake.png"

        property Notify target: _root.target
        signal send(int val_0, int val_1)
        onTargetChanged: send.connect(target.receive_2)


        MouseArea{
            anchors.fill: parent


            onClicked: {
                if(0 == _root.selfPrice)
                {
                    _root.send(_root.counter+_root.counter*_root.amplify*0.01)
                }
                else if(_root.main_counter >= _root.selfPrice)
                {
                    timeTrigger = true;
                    _root.send(-1 * selfPrice)
                    _root.mult += 1
                    if(_root.counter == 0)
                    _snake.send(_root.counter, _root.amplify)
                    else
                     _snake.send(_root.counter, 0)
                }
            }
        }
    }

    Text {
        id: _nums
        x: _root.width
        y: _root.width * 0.05
        color: "#78BD40"
        property string baseText: ""
        property int g_count: 0
        text: qsTr(baseText) + (timeTrigger ? mult + " pcs." : "")
        font.bold: true
        font.family: "Gill Sans"
        fontSizeMode: Text.FixedSize
        font.pixelSize: _root.width * 0.1  // 20
        font.italic: true

    }
    Text {
        id: _numsNames
        x: _root.width - _root.width * 0.7
        y: _root.width * 0.05
        color: "#78BD40"
        property string baseText: "You bought:"
        property int g_count: 0
        text: qsTr("")+ (selfPrice ? baseText : "")
        font.bold: true
        font.family: "Gill Sans"
        fontSizeMode: Text.FixedSize
        font.pixelSize: _root.width * 0.1  // 20
        font.italic: true

    }

    Text {
        id: _price
        x: _root.width * 0.33
        y: _root.width * 0.8
        color: "#EDED75"
        property int g_count: 0
        property string baseText: _root.selfPrice.toString()
        text: qsTr("")+ (selfPrice ? baseText + " eggs" : "")
        font.bold: true
        font.family: "Gill Sans"
        fontSizeMode: Text.FixedSize
        font.pixelSize: _root.width * 0.1  // 20
        font.italic: true

    }
    Text {
        id: _priceNames
        x: _root.width * 0.029
        y: _root.width * 0.8
        color: "#EDED75"
        property string baseText: "Price:"
        property int g_count: 0
        text: qsTr("")+ (selfPrice ? baseText : "")
        font.bold: true
        font.family: "Gill Sans"
        fontSizeMode: Text.FixedSize
        font.pixelSize: _root.width * 0.1  // 20
        font.italic: true

    }

    Timer {
        interval: 1000
        running: _root.counter != 0 ? timeTrigger : false
        repeat: _root.counter != 0 ? timeTrigger : false
        onTriggered: _root.send(_root.counter * _root.mult +(_root.counter * _root.mult*_root.amplify)*0.01)
    }
}
