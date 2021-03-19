import QtQuick 2.14
import QtQuick.Controls 2.12
import QtQuick.Window 2.12
import QtQuick.Layouts 1.14

Window {
    visible: true
    width: 640
    height: 480
    title: testListmodel.titleStr//qsTr("Hello World")

    Image {
        id: name
        asynchronous: true
        mipmap: true
        fillMode: Image.PreserveAspectFit
        anchors.centerIn: parent
        source: "qrc:/../resource/quicktest/background.png"

        Item {
            anchors.fill: parent
            property variant colorArray: ["#00bde3", "#67c111", "#ea7025"]
            Column {
                visible: false
                spacing: 2
                anchors.centerIn: parent

                Rectangle{
                    height: 10
                    width: 10
                    color: "red"
                }

                Rectangle{
                    height: 20
                    width: 20
                    color: "blue"
                }

                Rectangle{
                    height: 30
                    width : 30
                    color: "black"
                }
            }
            Row{
                visible: false
                spacing: 10
                anchors.centerIn: parent
                Rectangle{
                    height: 10
                    width: 10
                    color: "red"
                }

                Rectangle{
                    height: 20
                    width: 20
                    color: "blue"
                }

                Rectangle{
                    height: 30
                    width : 30
                    color: "black"
                }
            }
            Flow{
                visible: false
                spacing: 20
                width : parent.width
                Rectangle{
                    height: 10
                    width: 100
                    color: "red"
                }

                Rectangle{
                    height: 20
                    width: 200
                    color: "blue"
                }

                Rectangle{
                    height: 30
                    width : 300
                    color: "black"
                }

                Rectangle{
                    height: 10
                    width: 10
                    color: "red"
                }

                Rectangle{
                    height: 20
                    width: 20
                    color: "blue"
                }

                Rectangle{
                    height: 30
                    width : 30
                    color: "black"
                }
            }
            Grid{
                visible: false
                width: parent.width
                height: parent.height
                spacing: 20
                Repeater{
                    model: 16
                    Rectangle{
                        width: 100
                        height: 100
                        property int colorindex : Math.floor(Math.random() * 3)
                        color: "red"
                        Text {
                            text: qsTr("grid ") + index
                            anchors.centerIn: parent
                        }
                    }
                }
            }

            TextInput {
                visible: falsee
                focus: false
                width: 100
                height: 20
                text: "please input ."
                selectionColor: "blue"
                color: "red"
            }

            TextInput{
                visible: false
                focus: true
                x : 200
                y : 200
                width: 100
                height: 20

                text: "please intpu 2"
            }
        }

        ListView {
            visible: false
            spacing: 2
            anchors.fill: parent
            anchors.horizontalCenter: parent.horizontalCenter
            model: testListmodel
            delegate: Rectangle {
                color: "transparent"
                width: parent.width
                height: 40
                RowLayout {
                    Text {
                        Layout.preferredHeight: height
                        Layout.preferredWidth: width
                        text: nickname1//qsTr("nickname1")
                        verticalAlignment: Text.verticalAlignment
                        font.pixelSize: 16
                        color: "white"
                    }
                    Text {
                        Layout.preferredHeight: height
                        Layout.preferredWidth: width
                        text: nickname1//qsTr("nickname2")
                        font.pixelSize: 14
                        color: "white"
                        verticalAlignment: Text.verticalAlignment
                    }
                    Item {
                        Layout.fillWidth: true
                    }
                }
            }
        }

        MouseArea {
            visible: true
            anchors.fill: parent
            cursorShape: Qt.PointingHandCursor
            onClicked: {
                console.log("onclick rotation")
                //wheel.rotation += 90
                wheel.y = 0
                animation1.start()
            }
        }

        Image{
            visible: true
            id: wheel
            //anchors.centerIn: parent
            //anchors.horizontalCenterOffset: 10
            fillMode: Image.PreserveAspectFit
            source: "qrc:/../resource/quicktest/pinwheel.png"

            Behavior on rotation {
                NumberAnimation {
                    duration : 250
                }
            }
            NumberAnimation on y {
                id: animation1
                to : 100
                duration: 1000
                loops: 1
            }

//            NumberAnimation {
//                id: animation1
//                target: wheel
//                properties: "y"
//                from : 250
//                to : 10
//                duration: 1000
//            }
        }
    }
}
