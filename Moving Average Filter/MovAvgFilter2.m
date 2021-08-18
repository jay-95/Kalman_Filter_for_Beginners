function avg  = MovAvgFilter2(x)
    persistent prevAvg n xbuf
    persistent firstRun
    
    if isenpty(firstRun)
        n = 10;
        xbuf = x*ones(n, 1);
        
        firstRun = 1;
    end
    
    for m = 1:n-1
        xbuf(m) = xbuf(m+1);
    end
    xbuf(n) = x;
    
    avg = sum(xbuf)/n;a
end