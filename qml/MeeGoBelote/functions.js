function onAdd()
{
    add.visible  = true;
    btns.visible = false;
    error.visible = false;
}

function onAdded(tA, tB)
{
    add.visible  = false;
    btns.visible = true;

    tA = parseInt(tA.text);
    tB = parseInt(tB.text);

    if(isNaN(tA))
    {
        errorText.text = "Please enter a number."
        error.visible = true;
        return;
    }

    model.append({
                     "number": model.count + 1,
                     "teamA": tA,
                     "teamB": tB
                 });

    tA.text = "";
    tB.text = "";

    model.sumA = 0;
    model.sumB = 0;
    var i;
    for(i = 0; i < model.count; ++i)
    {
        model.sumA += model.get(i).teamA;
        model.sumB += model.get(i).teamB;
    }

    // You cannot win if you just made a valat (the only case where you can
    // have enough points to win while being valat is to have a belote, hence
    // two points).
    if(model.sumA >= 101 && tA !== 2)
    {
        errorText.text = "Team A has won!"
        error.visible = true;
    }
    else if(model.sumB >= 101 && tB !== 2)
    {
        errorText.text = "Team B has won!"
        error.visible = true;
    }
}

function onClear()
{
    model.clear();
    model.sumA = 0;
    model.sumB = 0;
}
