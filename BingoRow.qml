import QtQuick 2.0
import QtQuick.Layouts 1.3

RowLayout {
    property alias label: labelBox.text

    property int start: 1

    spacing: 2

    function reset() {
        item1.selected = false;
        item2.selected = false;
        item3.selected = false;
        item4.selected = false;
        item5.selected = false;
        item6.selected = false;
        item7.selected = false;
        item8.selected = false;
        item9.selected = false;
        item10.selected = false;
        item11.selected = false;
        item12.selected = false;
        item13.selected = false;
        item14.selected = false;
        item15.selected = false;
    }

    function select(item) {
        switch(item) {
        case 1:
            item1.selected = true;
            break;
        case 2:
            item2.selected = true;
            break;
        case 3:
            item3.selected = true;
            break;
        case 4:
            item4.selected = true;
            break;
        case 5:
            item5.selected = true;
            break;
        case 6:
            item6.selected = true;
            break;
        case 7:
            item7.selected = true;
            break;
        case 8:
            item8.selected = true;
            break;
        case 9:
            item9.selected = true;
            break;
        case 10:
            item10.selected = true;
            break;
        case 11:
            item11.selected = true;
            break;
        case 12:
            item12.selected = true;
            break;
        case 13:
            item13.selected = true;
            break;
        case 14:
            item14.selected = true;
            break;
        case 15:
            item15.selected = true;
            break;
        default:
            console.log("Error, invalid item.");
            break;
        }
    }

    function isSelected(item) {
        switch(item) {
        case 1:
            return item1.selected;
        case 2:
            return item2.selected;
        case 3:
            return item3.selected;
        case 4:
            return item4.selected;
        case 5:
            return item5.selected;
        case 6:
            return item6.selected;
        case 7:
            return item7.selected;
        case 8:
            return item8.selected;
        case 9:
            return item9.selected;
        case 10:
            return item10.selected;
        case 11:
            return item11.selected;
        case 12:
            return item12.selected;
        case 13:
            return item13.selected;
        case 14:
            return item14.selected;
        case 15:
            return item15.selected;
        default:
            console.log("Error, invalid item.");
            break;
        }
    }

    BingoRowHeader {
        id: labelBox

        Layout.preferredWidth: (parent.width / 16) - 2
        Layout.preferredHeight: parent.height - 2
    }

    BingoSquare {
        id: item1

        row: label
        column: start

        Layout.preferredWidth: (parent.width / 16) - 2
        Layout.preferredHeight: parent.height - 2
    }

    BingoSquare {
        id: item2

        row: label
        column: start + 1

        Layout.preferredWidth: (parent.width / 16) - 2
        Layout.preferredHeight: parent.height - 2
    }

    BingoSquare {
        id: item3

        row: label
        column: start + 2

        Layout.preferredWidth: (parent.width / 16) - 2
        Layout.preferredHeight: parent.height - 2
    }

    BingoSquare {
        id: item4

        row: label
        column: start + 3

        Layout.preferredWidth: (parent.width / 16) - 2
        Layout.preferredHeight: parent.height - 2
    }

    BingoSquare {
        id: item5

        row: label
        column: start + 4

        Layout.preferredWidth: (parent.width / 16) - 2
        Layout.preferredHeight: parent.height - 2
    }

    BingoSquare {
        id: item6

        row: label
        column: start + 5

        Layout.preferredWidth: (parent.width / 16) - 2
        Layout.preferredHeight: parent.height - 2
    }

    BingoSquare {
        id: item7

        row: label
        column: start + 6

        Layout.preferredWidth: (parent.width / 16) - 2
        Layout.preferredHeight: parent.height - 2
    }

    BingoSquare {
        id: item8

        row: label
        column: start + 7

        Layout.preferredWidth: (parent.width / 16) - 2
        Layout.preferredHeight: parent.height - 2
    }

    BingoSquare {
        id: item9

        row: label
        column: start + 8

        Layout.preferredWidth: (parent.width / 16) - 2
        Layout.preferredHeight: parent.height - 2
    }

    BingoSquare {
        id: item10

        row: label
        column: start + 9

        Layout.preferredWidth: (parent.width / 16) - 2
        Layout.preferredHeight: parent.height - 2
    }

    BingoSquare {
        id: item11

        row: label
        column: start + 10

        Layout.preferredWidth: (parent.width / 16) - 2
        Layout.preferredHeight: parent.height - 2
    }

    BingoSquare {
        id: item12

        row: label
        column: start + 11

        Layout.preferredWidth: (parent.width / 16) - 2
        Layout.preferredHeight: parent.height - 2
    }

    BingoSquare {
        id: item13

        row: label
        column: start + 12

        Layout.preferredWidth: (parent.width / 16) - 2
        Layout.preferredHeight: parent.height - 2
    }

    BingoSquare {
        id: item14

        row: label
        column: start + 13

        Layout.preferredWidth: (parent.width / 16) - 2
        Layout.preferredHeight: parent.height - 2
    }

    BingoSquare {
        id: item15

        row: label
        column: start + 14

        Layout.preferredWidth: (parent.width / 16) - 2
        Layout.preferredHeight: parent.height - 2
    }
}
