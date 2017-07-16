import QtQuick 2.0
import QtMultimedia 5.0

Rectangle
{
    id: root
    anchors.fill: parent
    color: 'black'

    /* * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
     * MODEL - Data & main properties                          *
     * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */



    property int mainScore:0
    property int avatarSpeed: 1300
    property int avatarMoveInterval: 1000
    property int timeCountDown: -1
    property int maxBullet: -1
    property int currentBullet: 0
    property string targetName: "Olive"
    property string targetSprite: "qrc:/Levels/AbsG/" + "001" + ".png"
    property string explositionSprite: "qrc:/GameSprites/" + "explosion" + ".gif"





    /* * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
     * VIEWMODEL - Engine & business rules                     *
     * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

    function loadLevelData(json)
    {
        var data = tools.loadJsonFile(json)
        console.debug("Salut : " + data.name)
    }

    function avatarMove(oldValue, minValue, maxValue)
    {

        return Math.random(maxValue) * (maxValue-minValue)
    }

    function test()
    {
     loadLevelData("qrc:/Levels/AbsG/level.json")
    }


    // Audio

    Audio {
    id:audio
    source: "qrc:/gunshot5.wav"


    }


    // MainLoop
    Timer
    {
        id:gameLoop
        interval: avatarMoveInterval
        running: true
        repeat: true
        onTriggered:
        {
//            avatar.x = avatarMove(avatar.x, 0, root.width-70)
//            avatar.y = avatarMove(avatar.y, 0, root.height-70)
//            test()
        }
    }


    /* * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
     * VIEW - Layout of the application                        *
     * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
    Image
    {
        id: avatar
        width: 70
        height: 70
        source: targetSprite

        x: root.width/2 - 35
        y: root.height/2 - 35

        Behavior on x {NumberAnimation
        {
            easing.type: Easing.OutQuad
            duration:avatarSpeed
        }}
        Behavior on y {NumberAnimation
        {
            easing.type: Easing.OutQuad
            duration:avatarSpeed
        }}
    }

    MouseArea
    {
        id: avatarMouse
        anchors.fill: avatar
        onPressed:
        {
            audio.stop()
            audio.play()
            avatar.visible = false
            avatarExplosion.visible = true
            gameLoop.stop()
            avatarExplosion.start()

        }
    }

    Text
    {
        color: "white"
        text: mainScore + " points"
        anchors.right: root.right
    }


    AnimatedSprite
    {
        id: avatarExplosion
        frameCount: 14
        frameWidth: 70
        frameHeight: 70
        frameRate: 20
        source: explositionSprite
        width: 70
        height: 70
        anchors.centerIn: avatar
        visible: false
        loops: 1

        onRunningChanged:
        {
            if (!running)
            {
                visible = false
                avatar.visible = true
                mainScore++
                gameLoop.start()
            }
        }
    }
}
