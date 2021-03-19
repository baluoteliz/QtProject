import QtQuick 2.0

Item {
    Column {
        visible: false
        anchors.centerIn: parent
        spacing: 2
        Repeater{
            model: ListModel{
                ListElement { name: "Mercury"; surfaceColor: "gray" }
                ListElement { name: "Venus"; surfaceColor: "yellow" }
                ListElement { name: "Earth"; surfaceColor: "blue" }
                ListElement { name: "Mars"; surfaceColor: "orange" }
                ListElement { name: "Jupiter"; surfaceColor: "orange" }
                ListElement { name: "Saturn"; surfaceColor: "yellow" }
                ListElement { name: "Uranus"; surfaceColor: "lightBlue" }
                ListElement { name: "Neptune"; surfaceColor: "lightBlue" }
            }

            delegate: Rectangle {
                id: rect1
                width: 100
                height: 20
                radius: 3
                color: "lightBlue"

                Text {
                    text: name
                    color: surfaceColor
                    anchors.centerIn: parent
                }

                MouseArea{
                    hoverEnabled: true
                    onEntered: rect1.color = "red"
                    onExited: rect1.color = "lightBlue"
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                }
            }
        }
    }
    ListView {
        anchors.centerIn: parent
        width: parent.width
        height: 40
        anchors.margins: 20
        clip: false
        model: 10
        delegate: numberDelegate
        spacing: 5
        orientation: ListView.Horizontal
    }

    Component {
        id: numberDelegate

        Rectangle {
            width: 40
            height: 40

            color: "lightGreen"

            Text {
                anchors.centerIn: parent

                font.pixelSize: 10

                text: index
            }
        }
    }
}
