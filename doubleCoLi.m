function SSE = doubleCoLi(x0)
    Co = x0(1);
    Li = x0(2);
    SO4 = x0(3);
    global Q_Co
    global Q_Li
    y1 = Co * SO4 - Q_Co;
    y2 = Li * Li * SO4 - Q_Li;
    y3 = 2*Co + Li - 2*SO4;
    SSE = sum([y1,y2,y3].^2);
end