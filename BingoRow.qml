import QtQuick 2.0
import QtQuick.Layouts 1.3

RowLayout {
    property alias label: labelBox.text

    property int start: 1

    spacing: 2

    BingoSquare {
        id: labelBox

        Layout.preferredWidth: (parent.width / 16) - 2
        Layout.preferredHeight: parent.height
    }

    BingoSquare {
        id: item1

        text: start

        Layout.preferredWidth: (parent.width / 16) - 2
        Layout.preferredHeight: parent.height
    }

    BingoSquare {
        id: item2

        text: start + 1

        Layout.preferredWidth: (parent.width / 16) - 2
        Layout.preferredHeight: parent.height
    }

    BingoSquare {
        id: item3

        text: start + 2

        Layout.preferredWidth: (parent.width / 16) - 2
        Layout.preferredHeight: parent.height
    }

    BingoSquare {
        id: item4

        text: start + 3

        Layout.preferredWidth: (parent.width / 16) - 2
        Layout.preferredHeight: parent.height
    }

    BingoSquare {
        id: item5

        text: start + 4

        Layout.preferredWidth: (parent.width / 16) - 2
        Layout.preferredHeight: parent.height
    }

    BingoSquare {
        id: item6

        text: start + 5

        Layout.preferredWidth: (parent.width / 16) - 2
        Layout.preferredHeight: parent.height
    }

    BingoSquare {
        id: item7

        text: start + 6

        Layout.preferredWidth: (parent.width / 16) - 2
        Layout.preferredHeight: parent.height
    }

    BingoSquare {
        id: item8

        text: start + 7

        Layout.preferredWidth: (parent.width / 16) - 2
        Layout.preferredHeight: parent.height
    }

    BingoSquare {
        id: item9

        text: start + 8

        Layout.preferredWidth: (parent.width / 16) - 2
        Layout.preferredHeight: parent.height
    }

    BingoSquare {
        id: item10

        text: start + 9

        Layout.preferredWidth: (parent.width / 16) - 2
        Layout.preferredHeight: parent.height
    }

    BingoSquare {
        id: item11

        text: start + 10

        Layout.preferredWidth: (parent.width / 16) - 2
        Layout.preferredHeight: parent.height
    }

    BingoSquare {
        id: item12

        text: start + 11

        Layout.preferredWidth: (parent.width / 16) - 2
        Layout.preferredHeight: parent.height
    }

    BingoSquare {
        id: item13

        text: start + 12

        Layout.preferredWidth: (parent.width / 16) - 2
        Layout.preferredHeight: parent.height
    }

    BingoSquare {
        id: item14

        text: start + 13

        Layout.preferredWidth: (parent.width / 16) - 2
        Layout.preferredHeight: parent.height
    }

    BingoSquare {
        id: item15

        text: start + 14

        Layout.preferredWidth: (parent.width / 16) - 2
        Layout.preferredHeight: parent.height
    }
}
