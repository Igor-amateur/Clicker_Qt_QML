import QtQuick 2.15
Item {
    id: _root
    property int parentWidth: 640
    property int mWorldTime: 1000
    property int start_x : parentWidth * 0.2
    property int start_y : parentWidth * 0.55
    property int target_y : 0

    Placeholder {
        id: _placeEgg
        property bool runningAnimation: true
        property double scaleAnimation: 0.0
        property int sizeEgg: 50 * scaleAnimation * (parentWidth/640)

        width: sizeEgg
        height: sizeEgg * 1.364
        Image {
            id: _egg
            anchors.fill: parent
            opacity : 1.0  * scaleAnimation
            source: "/Images/egg.png"
        }

        // Animation
        SequentialAnimation on  scaleAnimation{
            PropertyAnimation {
                to: 1.0
                duration: mWorldTime * 0.3
            }
            PauseAnimation { duration: mWorldTime * 0.4 }
            PropertyAnimation {
                to: 0.0
                duration: mWorldTime * 0.3

            }
            onRunningChanged: {
                if (runningAnimation) {
                    console.log("Destroying...")
                    animation: false
                    _placeEgg.destroy();
                }
            }//https://runebook.dev/ru/docs/qt/qtqml-javascript-dynamicobjectcreation
        }

    }

    ParallelAnimation {
        running: true

        NumberAnimation {
            target: _placeEgg
            property: "rotation"
            from: 0
            to: 720
            duration: mWorldTime
            running: true
            easing.type: Easing.OutInCubic
        }
        NumberAnimation {
            target: _placeEgg
            property: "y"
            from: start_y
            to: 0
            running: true
            duration: mWorldTime
        }
        NumberAnimation {
            target: _placeEgg
            property: "x"
            from: start_x
            to: start_x
            running: true
            duration: mWorldTime
        }
    }

}
