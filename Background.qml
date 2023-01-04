import QtQuick 2.15

Item {
    width: 640
    height: 480

    Rectangle{
        id: _mainRect
        gradient: Gradient{
            GradientStop{
                position: 0
                color: "#696969"
            }
            GradientStop{
                position: 1
                color: "#800000"
            }
        }
        anchors.fill: parent
    }
}
