
var runCoins;

runCoins = function (choice)
{



    console.log("Run coins, you choose " + choice);

    var res = Math.floor((Math.random() * 2));


    if (res == choice)
    {
        icon.source = "qrc:/success.svg";
        label.text = ["Pile", "Face"][choice] + " ! Bravo !";
    }
    else
    {
        icon.source = "qrc:/failed.svg";
        label.text = ["Face", "Pile"][choice] + " ! Dommage...";
    }

}


