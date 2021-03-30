import QtQuick 2.0
import QtQuick.Controls 2.14
import QtQuick.Layouts 1.14



Item {
  id: root

  function call(msg) {
      var exp = msg.toString();
      console.log(exp)
      var data = {
          expression : msg
      }
      try {
          var fun = new Function('return (' + exp + ');');
          data.result = JSON.stringify(fun.call(scope), null, 2)
          console.log(JSON.stringify(scope, null, 2) + 'result: ' + result)
      } catch(e) {
          console.log(e.toString())
          data.error = e.toString();
      }
      return data;
  }

  function jsCall(exp) {
      var data = call(exp);
      // insert the result at the beginning of the list
      outputModel.insert(0, data)
  }

  ColumnLayout {
      anchors.fill: parent
      anchors.margins:9
      RowLayout {
          Layout.fillWidth: true
          TextField {
              id: input
              Layout.fillWidth: true
              focus: true
              onAccepted: {
                  // call our evaluation function on root
                  root.jsCall(input.text)
              }
          }
          Button {
              text: qsTr("Send")
              onClicked: {
                  // call our evaluation function on root
                  root.jsCall(input.text)
              }
          }
      }
      Item {
          Layout.fillWidth: true
          Layout.fillHeight: true
          Rectangle {
              anchors.fill: parent
              color: '#333'
              border.color: Qt.darker(color)
              opacity: 0.2
              radius: 2
          }

          ScrollView {
              id: scrollView
              anchors.fill: parent
              anchors.margins: 9
              ListView {
                  id: resultView
                  model: ListModel {
                      id: outputModel
                  }
                  delegate: ColumnLayout {
                      width: ListView.view.width
                      Label {
                          Layout.fillWidth: true
                          color: 'green'
                          text: "> " + model.expression
                      }
                      Label {
                          Layout.fillWidth: true
                          color: 'blue'
                          text: "" + model.result
                      }
                      Rectangle {
                          height: 1
                          Layout.fillWidth: true
                          color: '#333'
                          opacity: 0.2
                      }
                  }
              }
          }
      }
  }
}
