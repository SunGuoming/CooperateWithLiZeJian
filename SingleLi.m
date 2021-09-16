function SSE = SingleLi(x0)
    global Co_ii
    Li = x0(1);
    SO4 = x0(2);

    global Q_Li
    
    y2 = Li * Li * SO4 - Q_Li;
    y3 = 2*Co_ii + Li - 2*SO4;
    
    SSE = sum([y2,y3].^2);
    
end