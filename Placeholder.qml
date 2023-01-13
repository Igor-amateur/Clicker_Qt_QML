import QtQuick 2.15

Item {
    id: _root
    width: 200
    height: 200
    x: 100
    y: 100
    property alias borderColor: _button.borderColor
    property alias borderWidth: _button.borderWidth
    Rectangle{
        id: _button
        property string borderColor: "transparent"
        property int borderWidth: 3
        color: "transparent"
        border.color: borderColor
        border.width: borderWidth
        anchors.fill: parent

    }
}
