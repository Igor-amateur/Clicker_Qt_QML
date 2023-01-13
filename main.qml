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

    Counter{
        id: _count_2
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
                anchors.margins:0

                Notify {
                    id: _showresult
                    target: _rotation
                    property alias aliasCount: _count.gamerCount
                    aliasCount: displayCount
                    displayCount_2: _count_2.gamerCount
                    width: parent.width * 0.7
                    height: parent.height * 0.3
                    x: parent.width * 0.1
                    y: parent.width * 04
                    fontPixelSize: _mainwindow.width*0.07
                    anchors{
                        top: parent.top
                        horizontalCenter: parent.horizontalCenter
                    }
                }

                Clicker{
                    id: _clicker
                    target: _showresult
                    width: parent.width * 0.7
                    height: parent.width * 0.7
                    x: parent.width * 0.1
                    y: parent.height * 0.4
                //    anchors.top: _showresult.bottom

                }

            }

            Column{
                id: _container2
                anchors.left: _leftCol.right
                width: parent.width * 0.5
                height: _mainwindow.height
                anchors.margins: 10
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
                    width: parent.width-10
                    anchors.top: _storeText.bottom
                    anchors.bottom: parent.bottom

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
                        borderColor: "#2B490B"
                        borderWidth: 5
                        aLLmargins: _mainwindow.width * marginsCoef
                    }

                }
            }
        }
    }
    ListModel{
        id: _mod

        ListElement{
            property string source: "/Images/clickhand.png"
            property double coefficient: 0.5
            property int count: 1
            property int count_2: 0
            property int price: 10
            property double marginsCoef: 0.05
        }

        ListElement{
            property string source: "/Images/grandmother.png"
            property double coefficient: 0.5
            property int count: 50
            property int price: 500
            property int count_2: 0
            property double marginsCoef: 0.03
        }

        ListElement{
            property string source: "/Images/farm.png"
            property double coefficient: 0.5
            property int count: 1000
            property int price: 10000
            property int count_2: 0
            property double marginsCoef: 0
        }
    }
}

