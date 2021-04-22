for k = 1: 100
    x = sqrt(k);
    if ((k>10) && (x - floor(x)==0))
        break
    end
end
k