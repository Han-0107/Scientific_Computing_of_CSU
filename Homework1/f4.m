function [fmax, fmin, fsum] = f4(f)
fmax = max(f);
fmin = min(f);
fsum = sum(f);
pos = 0;
neg = 0;
zer = 0;
for i=1:1:length(f)
    if f(i)>0
        pos = pos + 1;
    elseif f(i)<0
        neg = neg + 1;
    else
        zer = zer + 1;
    end
end
fprintf('the max number:%f\n', fmax);
fprintf('the min number:%f\n', fmin);
fprintf('the sum of numbers:%f\n', fsum);
fprintf('the number of positive:%f\n', pos);
fprintf('the number of negative:%f\n', neg);
fprintf('the number of zeros:%f\n', zer);
end
