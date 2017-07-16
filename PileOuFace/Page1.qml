import QtQuick 2.7
import QtQuick.Controls 2.0

Column
{
    id: root
    anchors.fill: parent

    Text
    {
        text: qsTr("Fait ton choix :")
    }

    SwipeView
    {
        id: swipeView
        currentIndex: tabBar.currentIndex


        Rectangle
        {
            id: choice1
            width: 200
            height: width
            color: "red"
            border.color: "black"
            border.width: 1
            radius: width*0.5

            Text
            {
              anchors.fill: parent
              text: "Pile"
            }
        }


        Rectangle
        {
            id: choice2
            width: 200
            height: width
            color: "red"
            border.color: "black"
            border.width: 1
            radius: width*0.5

            Text
            {
              anchors.fill: parent
              text: "Face"
            }
        }
    }


}
