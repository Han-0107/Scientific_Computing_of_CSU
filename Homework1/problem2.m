total = 0.0;
for n=1:1:1000
    total = total + log(1+n*n);
    if total>=999
        disp(n-1);
        break;
    end
end