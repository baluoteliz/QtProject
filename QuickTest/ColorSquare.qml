import QtQuick 2.0

Rectangle {
    property bool active: false
    property int size: 50
    signal btnClick()
    width: size
    height: size
    border.width: 2
    border.color: active ? "grey" : "white"

    MouseArea {
        anchors.fill: parent
        cursorShape: Qt.PointingHandCursor
        onClicked: {
            btnClick();
        }
    }
}
