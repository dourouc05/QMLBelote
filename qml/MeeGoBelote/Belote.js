function fillModel() {
    for(var i = 1; i <= 15; ++i) {
        updateModel({"number": i, "teamA": Math.floor(Math.random()*42/2), "teamB": Math.floor(Math.random()*42/2)});
    }
}

function emptyModel() {
    commonModel.clear();
    commonModel.sumA = 0;
    commonModel.sumB = 0;
}

function pushGame(a, b) {
    var ia = parseInt(a.text);
    var ib = parseInt(b.text);

    if(! isNaN(ia) && ! isNaN(ib))
    {
        updateModel({"number": commonModel.count + 1, "teamA": ia, "teamB": ib});
        appWindow.pageStack.pop();

        a.text = "";
        b.text = "";
    }
}

/**
  * var data = {"number": int, "teamA": int, "teamB": int};
  */
function updateModel(data) {
    commonModel.append(data);
    commonModel.sumA += data.teamA;
    commonModel.sumB += data.teamB;

    // Then check whether someone have won
    if(! commonModel.goOn) {
        if(commonModel.sumA >= 101) {
            commonQueryDialog.titleText = "Team A has won!"
            commonQueryDialog.message   = "Team A has won, would you like to reset scores or to go on? "
            commonQueryDialog.open()
        }
        if (commonModel.sumB >= 101) {
            commonQueryDialog.titleText = "Team B has won!"
            commonQueryDialog.message   = "Team B has won, would you like to reset scores or to go on? "
            commonQueryDialog.open()
        }
    }
}

function popModel() {
    commonModel.sumA -= commonModel.get(commonModel.count - 1).teamA;
    commonModel.sumB -= commonModel.get(commonModel.count - 1).teamB;
    commonModel.remove(commonModel.count - 1);
}
