function onAdd()
{
    model.append({
                     "number": model.count + 1,
                     "teamA": 2,
                     "teamB": 3
                 });
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
