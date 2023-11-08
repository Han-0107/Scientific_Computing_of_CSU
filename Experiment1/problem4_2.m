n=100;
ans=1;
fprintf('As n==100,\n');
for i=1:1:n
    ans=ans*(((2*i)*(2*i))/((2*i-1)*(2*i+1)));
end
disp(ans);

n=1000;
ans=1;
fprintf('As n==1000,\n');
for i=1:1:n
    ans=ans*(((2*i)*(2*i))/((2*i-1)*(2*i+1)));
end
disp(ans);

n=10000;
ans=1;
fprintf('As n==10000,\n');
for i=1:1:n
    ans=ans*(((2*i)*(2*i))/((2*i-1)*(2*i+1)));
end
disp(ans);

m=[100,1000,10000];
res=ones(1,3);
for i=1:1:3
    for j=1:1:m(i)
        res(i) = res(i) * (((2*j)*(2*j))/((2*j-1)*(2*j+1)));
    end
end
disp(res);