import QtQuick 2.0

Item {
    id: root
    width: 200
    height: 100

    Rectangle {
         id: light1
         x: 25; y: 15
         width: 100; height: width
         radius: width/2
         color: "black"
     }

     Rectangle {
         id: light2
         x: 25; y: 135
         width: 100; height: width
         radius: width/2
         color: "black"
     }

     state: "stop"

     states: [
         State {
             name: "stop"
             PropertyChanges { target: light1; color: "red" }
             PropertyChanges { target: light2; color: "black" }
         },
         State {
             name: "go"
             PropertyChanges { target: light1; color: "black" }
             PropertyChanges { target: light2; color: "green" }
         }
     ]

     MouseArea {
          anchors.fill: parent
          onClicked: parent.state = (parent.state == "stop"? "go" : "stop")
      }

     transitions: [
         Transition {
             from: "stop"; to: "go"
             ColorAnimation { target: light1; properties: "color"; duration: 2000 }
             ColorAnimation { target: light2; properties: "color"; duration: 2000 }
         }
     ]
}
