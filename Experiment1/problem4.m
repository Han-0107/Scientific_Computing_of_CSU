n=100;
fprintf('As n==100,\n');
ans=0;
for i=1:1:n
    ans = ans + 1/(i*i);
end
disp(ans);

n=1000;
fprintf('As n==1000,\n');
ans=0;
for i=1:1:n
    ans = ans + 1/(i*i);
end
disp(ans);

n=10000;
fprintf('As n==10000,\n');
ans=0;
for i=1:1:n
    ans = ans + 1/(i*i);
end
disp(ans);


m=[100,1000,10000];
res=zeros(1,3);
for i=1:1:3
    for j=1:1:m(i)
        res(i) = res(i) + 1/(j*j);
    end
end
disp(res);