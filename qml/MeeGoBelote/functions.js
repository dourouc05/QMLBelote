function onAdd(add, btns)
{
    add.visible  = true;
    btns.visible = false;
}

function onAdded(add, btns, tA, tB)
{
    add.visible  = false;
    btns.visible = true;

    model.append({
                     "number": model.count + 1,
                     "teamA": parseInt(tA.text),
                     "teamB": parseInt(tB.text)
                 });
    tA.text = "Team A";
    tB.text = "Team B";

    model.sumA = 0;
    model.sumB = 0;
    var i;
    for(i = 0; i < model.count; ++i)
    {
        model.sumA += model.get(i).teamA;
        model.sumB += model.get(i).teamB;
    }
}

function onClear()
{
    model.clear();
    model.sumA = 0;
    model.sumB = 0;
}
