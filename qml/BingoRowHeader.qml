import QtQuick 2.0
import QtQuick.Layouts 1.3

Rectangle {
    color: "#219fa3"

    property alias text: textbox.text

    border.color: "white"

    Text {
        id: textbox

        anchors.fill: parent

        color: "white"

        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter

        font.bold: true

        font.pointSize: 128
        minimumPointSize: 16

        fontSizeMode: Text.Fit
    }
}
