import QtQuick 2.15
import QtQuick.Window 2.15
import Counter 1.0

Window {
    id: _mainwindow
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    Counter{
        id: _count
        property int gamerCount: 0
        main_count: gamerCount
    }

    Background{
        id: _background
        anchors.fill: parent
        Row{
            anchors.fill: parent
            anchors.margins: 20

            Column{
                id: _leftCol
                width: parent.width * 0.5
                height: _mainwindow.height
                anchors.margins: 10
                Notify {
                    id: _showresult
                    target: _rotation
                    property alias aliasCount: _count.gamerCount
                    aliasCount: displayCount
                    width: parent.width * 0.7
                    height: parent.height * 0.2
                    x: parent.width * 0.1
                    y: parent.height * 0.05
                    fontPixelSize: _mainwindow.width*0.07
                    anchors.bottom: _clicker.top
                    anchors.bottomMargin: _mainwindow.height*0.2
                }

                Clicker{
                    id: _clicker
                    target: _showresult
                    width: parent.width * 0.7
                    height: parent.width * 0.7
                    x: parent.width * 0.1
                    y: parent.height * 0.4

                }
           /*     Egg{
                    id: _rotation
                    x: _clicker.x + _clicker.width *0.5
                    y: _clicker.y + _clicker.width
                }*/
            }

            Column{
                id: _container2
                width: parent.width * 0.5
                height: _mainwindow.height
                Text {
                    id: _storeText
                    text: qsTr("Store")
                    anchors{
                        top: parent.top
                        horizontalCenter: parent.horizontalCenter
                    }

                    font.pixelSize: _mainwindow.width*0.07
                    font.bold: true
                    font.family: "Gill Sans"
                    fontSizeMode: Text.FixedSize
                    font.italic: true
                    color: "white"
                }

                ListView{
                    id: _view
                    width: parent.width-20
                    anchors.top: _storeText.bottom
                    anchors.bottom: parent.bottom
                    anchors.right: parent.right
                    anchors.margins: 10
                    spacing: 10
                    visible: true
                    model: _mod
                    clip: true

                    delegate: Clicker {
                        target: _showresult
                        width: parent.width * coefficient
                        height: parent.width * coefficient
                        displaySource: source
                        counter: count
                        selfPrice: price
                        main_counter: _count.gamerCount
                    }

                }
            }
        }
    }
    ListModel{
        id: _mod

        ListElement{
            property string source: "/Images/clickhand.png"
            property double coefficient: 0.2
            property int count: 1
            property int price: 10
        }

        ListElement{
            property string source: "/Images/grandmother.png"
            property double coefficient: 0.6
            property int count: 50
            property int price: 500
        }

        ListElement{
            property string source: "/Images/farm.png"
            property double coefficient: 0.85
            property int count: 1000
            property int price: 10000
        }
    }




}

