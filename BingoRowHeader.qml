import QtQuick 2.0

Rectangle {
    color: "#4287f5"

    property alias text: textbox.text

    border.color: "white"

    Text {
        id: textbox

        anchors.fill: parent

        color: "white"

        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter

        font.bold: true

        font.pointSize: 36
        minimumPointSize: 16

        fontSizeMode: Text.Fit
    }

    MouseArea {
        anchors.fill: parent

        hoverEnabled: true

        onEntered: {
            if (parent.color == "#4287f5")
                parent.color = "#2478ff";
            else
                parent.color = "#f02438"
        }

        onExited: {
            if (parent.color == "#2478ff")
                parent.color = "#4287f5";
            else
                parent.color = "#f54254";
        }
    }
}
