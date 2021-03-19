import QtQuick 2.0
import QtGraphicalEffects 1.0

Item {
    Row {
        anchors.centerIn: parent
        spacing: 16

        Image {
            id: bk
            source: "qrc:/../resource/quicktest/pinwheel.png"
            asynchronous: true
            fillMode: Image.fillMode
            smooth: true
        }

        FastBlur {
            id: bkblur
            width: bk.width
            height: bk.height
            source: bk
            radius: bblur ? 32 : 0
            property bool bblur : false

            Behavior on radius {
                NumberAnimation {duration:  1000}
            }

            MouseArea{
                anchors.fill: parent
                cursorShape: Qt.PointingHandCursor
                onClicked: {
                    parent.bblur =  !bkblur.bblur
                }
            }
        }
    }
}
