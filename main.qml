import QtQuick 2.15
import QtQuick.Window 2.15
import Counter 1.0

Window {
    id: _mainwindow
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")
    property bool storeBut_1_Active: true
    property bool storeBut_2_Active: false

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

    Counter{
        id: _amplify
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
                    //
                    property alias aliasCount: _count.gamerCount
                    aliasCount: displayCount
                    //

                    displayCount_2: _count_2.gamerCount
                    //
                    property alias aliasAmplify: _amplify.gamerCount
                    aliasAmplify: displayAmplify
                    //
                    width: parent.width * 0.7
                    height: parent.width * 0.6
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
                    anchors.top: _showresult.bottom
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.margins: parent.width * 0.1

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
                Row{
                    id: _storeButtons
                    anchors.top: _storeText.bottom
                    anchors.left: parent.left
                    anchors.right: parent.right
                    width: parent.width
                    height: parent.width*0.1
                    Rectangle{//"#2B490B" "#EDED75"  "#78BD40"
                        id: _leftButton
                        anchors.left: _storeButtons.left
                        width: _storeButtons.width*0.5
                        height: _storeButtons.width*0.1
                        color: storeBut_1_Active ? "#2B490B" : "transparent"
                        border.color: storeBut_1_Active ? "#78BD40" : "#ffffff"
                        border.width: storeBut_1_Active ? 3 : 1
                        Text {
                            id: _type_1
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.verticalCenter: parent.verticalCenter
                            text: qsTr("suppliers")
                            font.pixelSize:  parent.width*0.1
                            color: storeBut_1_Active ? "#EDED75" : "#ffffff"
                        }
                        MouseArea{
                            anchors.fill: parent
                            onClicked: {
                                storeBut_1_Active = true
                                storeBut_2_Active = false
                            }
                        }
                    }
                    Rectangle{
                        id: _rightButton
                        anchors.left: _leftButton.right
                        anchors.right: _storeButtons.right
                        width: _storeButtons.width*0.5
                        height: _storeButtons.width*0.1
                        color: storeBut_1_Active ? "transparent" : "#2B490B"
                        border.color: storeBut_1_Active ? "#ffffff" : "#78BD40"
                        border.width: storeBut_1_Active ? 1 : 3
                        Text {
                            id: _type_2
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.verticalCenter: parent.verticalCenter
                            text: qsTr("amplifiers")
                            font.pixelSize:  parent.width*0.1
                            color: storeBut_1_Active ? "#ffffff" : "#EDED75"

                        }
                        MouseArea{
                            anchors.fill: parent
                            onClicked: {
                                storeBut_1_Active = false
                                storeBut_2_Active = true
                            }
                        }
                    }
                }

                ListView{
                    id: _view_1
                    width: parent.width-10
                    anchors.top: _storeButtons.bottom
                    anchors.bottom: parent.bottom
                    anchors.margins: 10
                    spacing: 10
                    model: _mod_1
                    clip: true
                    visible: storeBut_1_Active
                    delegate: Clicker {
                        anchors.horizontalCenter: parent.horizontalCenter
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
                        amplify: _amplify.gamerCount
                    }
                }

                ListView{
                    id: _view_2
                    width: parent.width-10
                    anchors.top: _storeButtons.bottom
                    anchors.bottom: parent.bottom
                    anchors.margins: 10
                    spacing: 10
                    model: _mod_2
                    clip: true
                    visible: storeBut_2_Active
                    delegate: Clicker {
                        anchors.horizontalCenter: parent.horizontalCenter
                        target: _showresult
                        width: parent.width * coefficient
                        height: parent.width * coefficient
                        displaySource: source
                        counter: count
                        selfPrice: price
                        main_counter: _count.gamerCount
                        amplify: model.amplify
                        borderColor: "#2B490B"
                        borderWidth: 5
                        aLLmargins: _mainwindow.width * marginsCoef
                    }
                }
            }
        }
    }

    ListModel{
        id: _mod_1

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


    ListModel{
        id: _mod_2

        ListElement{
            property string source: "/Images/amplifiers/10_percent.png"
            property double coefficient: 0.5
            property int count: 0
            property int count_2: 0
            property int amplify: 10
            property int price: 300
            property double marginsCoef: 0.05
        }
        ListElement{
            property string source: "/Images/amplifiers/20_percent.png"
            property double coefficient: 0.5
            property int count: 0
            property int count_2: 0
            property int amplify: 20
            property int price: 500
            property double marginsCoef: 0.05
        }
        ListElement{
            property string source: "/Images/amplifiers/30_percent.png"
            property double coefficient: 0.5
            property int count: 0
            property int count_2: 0
            property int amplify: 30
            property int price: 700
            property double marginsCoef: 0.05
        }
        ListElement{
            property string source: "/Images/amplifiers/50_percent.png"
            property double coefficient: 0.5
            property int count: 0
            property int count_2: 0
            property int amplify: 50
            property int price: 1100
            property double marginsCoef: 0.05
        }
        ListElement{
            property string source: "/Images/amplifiers/70_percent.png"
            property double coefficient: 0.5
            property int count: 0
            property int count_2: 0
            property int amplify: 70
            property int price: 1500
            property double marginsCoef: 0.05
        }

    }

}

