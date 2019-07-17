import QtQuick 2.0
import QtQuick.Layouts 1.3

Rectangle {
    property bool selected: false
    property int item

    onSelectedChanged: {
        color = (selected) ? "#f54254" : "#4287f5";

        var row;
        switch (Math.floor((item - 1) / 15)) {
        case 0: row = 'B'; break;
        case 1: row = 'I'; break;
        case 2: row = 'N'; break;
        case 3: row = 'G'; break;
        case 4: row = 'O'; break;
        }
    }

    Layout.preferredWidth: (parent.width / 15) - 2
    Layout.preferredHeight: (parent.height / 5) - 2

    color: "#4287f5"

    border.color: "white"

    Text {
        id: textbox

        text: item

        anchors.fill: parent

        color: "white"

        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter

        font.pointSize: 128
        minimumPointSize: 16

        fontSizeMode: Text.Fit
    }
}
