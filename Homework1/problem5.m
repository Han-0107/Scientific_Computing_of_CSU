sum = 0;
for i=1:2:2015
    sum = sum + 1/(i*(i+1)*(i+2));
end
y = sprintf('%.5f',sum);
disp(y);