function SSE = SingleCo(x0)
    global Li_ii
    Co = x0(1);
    SO4 = x0(2);

    global Q_Co
    
    y1 = Co * SO4 - Q_Co;
    y3 = 2*Co + Li_ii - 2*SO4;
    
    SSE = sum([y1,y3].^2);
end