import QtQuick 2.0
import QtMultimedia 5.0

Item {
    Rectangle {
        width: 800
        height: 600
        color: "black"

        MediaPlayer {
            id: player
            source: "qrc:/../resource/quicktest/01.mp4"
            autoPlay: true
        }

        VideoOutput {
            id: videoOutput
            source: player
            anchors.fill: parent
        }
    }
}
