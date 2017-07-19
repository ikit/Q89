import QtQuick 2.7 
import QtQuick.Controls 2.2

import "Script.js" as JS
 
ApplicationWindow
{
    visible: true 
    width: 400
    height: 600
    title: "Pile ou Face !"

 
    Rectangle
    {
        id: root
        color: "#b0bec5"
        anchors.fill: parent

        Image
        {
            id: header
            source: "qrc:/illustration.jpg"
            anchors.top: root.top
            anchors.left: root.left
            fillMode : Image.PreserveAspectFit

            width: root.width
        }

        Rectangle
        {
            height: 1
            color: "#000000"
            anchors.bottom: header.bottom
        }

        Button
        {
            id: pileButton
            anchors.top: header.bottom
            anchors.left: root.left
            anchors.margins: 10
            width: (root.width / 2) - 20
            text: "Pile !"

            background: Rectangle
            {
                color: "#808e95"
            }
            onClicked: JS.runCoins(0)
        }

        Button
        {
            id: faceButton
            anchors.top: header.bottom
            anchors.right: root.right
            anchors.margins: 10
            width: (root.width / 2) - 20
            text: "Face !"

            background: Rectangle
            {
                color: "#808e95"
            }
            onClicked: JS.runCoins(1)
        }


        Rectangle
        {
            id: result
            anchors.top: pileButton.bottom
            anchors.left: root.left
            anchors.right: root.right
            anchors.bottom: root.bottom
            anchors.topMargin: 10

            color: "#78909c"


            Rectangle
            {
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.right: parent.right
                height: 5
                gradient: Gradient
                {
                    GradientStop { position: 0.0; color: "#455a64" }
                    GradientStop { position: 1.0; color: "#718792" }
                }
            }


            Row
            {
                anchors.centerIn: parent
                spacing: 30
                Image
                {
                    id: icon
                    source: ""
                    width: 40
                    height: 40
                }
                Text
                {
                    id: label
                    text: ""
                    font.pixelSize: 22
                    height: 40
                    //verticalAlignment: Text.verticalCenter
                }
            }
        }

    }



} 
